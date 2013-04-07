require 'spec_helper'

describe "Posts" do
  
  let!(:admin) { create :admin }
  let!(:user) { create :user }
  let!(:blog_post) { create :post }
  let!(:valid_attributes) { attributes_for :post }
  
  context 'success' do

    it 'should get to posts index from home page' do
      visit root_path
      click_link 'Blog'
      current_path.should == posts_path
    end

    it 'should get to post show page if clicked on post title on post index' do
      visit posts_path
      click_link "post_#{blog_post.id}"
      current_path.should == post_path(blog_post)
    end

    it 'should get to post new if user admin' do
      sign_in_as!(admin)
      visit posts_path
      click_link 'new_post'
      current_path.should == new_post_path
    end

    it 'should get to post edit if user admin' do
      sign_in_as!(admin)
      visit posts_path
      click_link "edit_post_#{blog_post.id}"
      current_path.should == edit_post_path(blog_post)
    end

    it 'should create new post' do
      sign_in_as!(admin)
      visit new_post_path
      fill_in 'post_title', :with => valid_attributes[:title]
      fill_in 'post_body', :with => valid_attributes[:body]
    end

    it 'should update post' do
      sign_in_as!(admin)
      visit edit_post_path(blog_post)
      fill_in 'post_title', :with => valid_attributes[:title]
      fill_in 'post_body', :with => valid_attributes[:body]
      click_button 'Update'
      blog_post.reload
      blog_post.title.should == valid_attributes[:title]
      blog_post.body.should == valid_attributes[:body]
      current_path.should == post_path(blog_post)
      page.should have_content 'Post updated.'
    end

    it 'should delete post' do
      sign_in_as!(admin)
      visit posts_path
      expect {
        click_link "delete_post_#{blog_post.id}"
      }.to change(Post, :count).by(-1)
      current_path.should == posts_path
    end

  end 

  context 'failure' do

    it 'should not get to new post from posts index if user not admin' do
      sign_in_as!(user)
      visit posts_path
      page.should_not have_link 'new_post'
    end

    it 'should not get to new post from posts index if user not admin' do
      sign_in_as!(user)
      visit new_post_path
      current_path.should == posts_path
      page.should have_content "You can't do that."
    end

    it 'should not see links to delete and edit post on post index' do
      sign_in_as!(user)
      visit posts_path
      page.should_not have_link "edit_post_#{blog_post.id}"
      page.should_not have_link "delete_post_#{blog_post.id}"
    end

  end

end
