require 'spec_helper'

describe Comment do

  let!(:comment) { build :comment }
  let!(:post_comment) { build :post_comment }
  let!(:event_comment) { build :event_comment }

  context 'success' do

    it 'creates new comment' do
      post_comment.should be_valid
      event_comment.should be_valid
    end

    it 'responds to proper methods' do
      comment.should respond_to :user
      comment.should respond_to :commentable
      comment.should respond_to :body
    end

  end

  context 'failure' do

    it 'doesnt create new comment if user is blank' do
      post_comment.user = nil
      post_comment.should_not be_valid
    end

    it 'doesnt create new comment if commentable is blank' do
      post_comment.commentable = nil
      post_comment.should_not be_valid
    end

    it 'doesnt create new comment if body is blank' do
      post_comment.body = ''
      post_comment.should_not be_valid
    end

  end

end
