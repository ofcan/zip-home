require 'spec_helper'

describe CommentsController do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:blog_post) { create :post }
  let!(:valid_attributes) { attributes_for :comment }
  let!(:post_comment) { create :post_comment }
  
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

    it 'user should destroy his own comment' do
      sign_in(post_comment.user)
      expect {
        delete :destroy, :post_id => post_comment.commentable, :id => post_comment
      }.to change(Comment, :count).by(-1)
      response.should redirect_to post_comment.commentable
      flash[:notice].should == 'Comment destroyed.'
    end

    it 'founder can destroy comment of other users' do
      sign_in(founder)
      expect {
        delete :destroy, :post_id => post_comment.commentable, :id => post_comment
      }.to change(Comment, :count).by(-1)
      response.should redirect_to post_comment.commentable
      flash[:notice].should == 'Comment destroyed.'
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
    
    it 'user should not destroy comment of other users' do
      sign_in(user)
      expect {
        delete :destroy, :post_id => post_comment.commentable, :id => post_comment
      }.to_not change(Comment, :count)
      response.should redirect_to post_comment.commentable
      flash[:alert].should == "You can't do that."
    end
  end

end
