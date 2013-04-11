require 'spec_helper'

describe PostsController do
  
  let!(:user) { create :user }
  let!(:admin) { create :admin }
  let!(:blog_post) { create :post }
  let!(:valid_attributes) { attributes_for :post }
  let!(:invalid_attributes) { { :title => '', :body => '' } }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit new page and have proper variables' do
      sign_in(admin)
      get 'new'
      response.should be_success
      assigns(:post).should be_kind_of(Post)
    end

    it 'should visit show page and have proper variables' do
      get 'show', :id => blog_post
      response.should be_success
      assigns(:post).should be_kind_of(Post)
    end

    it 'should visit edit page and have proper variables' do
      sign_in(admin)
      get :edit, :id => blog_post
      response.should be_success
      assigns(:post).should be_kind_of(Post)
    end

    it 'should create new post given proper attributes' do
      sign_in(admin)
      expect {
        post :create, :post => valid_attributes
      }.to change(Post, :count).by(1)
      flash[:notice].should == 'Post created.'
      response.should redirect_to Post.last
    end

    it 'should update post with valid attributes' do
      sign_in(admin)
      put :update, :id => blog_post, :post => valid_attributes
      blog_post.reload
      blog_post.title.should == valid_attributes[:title]
      blog_post.body.should == valid_attributes[:body]
      response.should redirect_to blog_post
      flash[:notice].should == 'Post updated.'
    end

    it 'should delete post' do
      sign_in(admin)
      expect {
        delete :destroy, :id => blog_post
      }.to change(Post, :count).by(-1)
    end

  end

  context 'failure' do

    it 'should not be able to visit new page' do
      get :new
      response.should_not be_success
      flash[:alert].should == "You can't do that."
    end

    it 'should not be able to visit edit page' do
      get :edit, :id => blog_post
      response.should_not be_success
      flash[:alert].should == "You can't do that."
    end

    it 'should not create new post given invalid attributes' do
      sign_in(admin)
      expect {
        post :create, :post => invalid_attributes
      }.to_not change(Post, :count)
      flash[:alert].should == 'Post not created.'
    end

    it 'should not update post given invalid attributes' do
      sign_in(admin)
      put :update, :id => blog_post, :post => invalid_attributes
      blog_post.reload
      blog_post.title.should_not == valid_attributes[:title]
      blog_post.body.should_not == valid_attributes[:body]
      response.should render_template :edit
      flash[:alert].should == 'Post not updated.'
    end

    it 'should not delete post if user is not admin' do
      sign_in(user)
      expect {
        delete :destroy, :id => blog_post
      }.to_not change(Post, :count)
      flash[:alert].should == "You can't do that."
    end

  end

end
