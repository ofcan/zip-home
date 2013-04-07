require 'spec_helper'

describe "Posts" do
  
  let!(:blog_post) { FactoryGirl.create :post }
  
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

  end 

  context 'failure' do

    it 'should not get to new post from posts index if user not admin' do
      visit posts_path
      click_link 'new_post'
      current_path.should == posts_path
      page.should have_content "You can't do that."
    end

  end

end
