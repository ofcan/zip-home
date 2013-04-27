require 'spec_helper'

describe CommentsController do

  let!(:user) { create :user }
  let!(:blog_post) { create :post }
  let!(:valid_attributes) { attributes_for :comment }
  
  context 'success' do
    
    it 'signed in user should create new comment on post' do
      sign_in(user)
      expect {
        post :create, :post_id => blog_post, :comment => valid_attributes
      }.to change(Comment, :count).by(1)

      response.should redirect_to blog_post
      flash[:notice].should == 'Comment created.'

      Comment.last.commentable.should == blog_post
      Comment.last.user.should == user
    end

  end

  context 'failure' do
    
    it 'not signed in user should not create comment' do
      expect {
        post :create, :post_id => blog_post, :comment => valid_attributes
      }.to_not change(Comment, :count)
      response.should redirect_to new_user_session_path
      flash[:alert].should == 'You need to sign in or sign up before continuing.'
    end
  end

end
