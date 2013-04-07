require 'spec_helper'

describe Post do

  let!(:post) { build :post }

  it 'creates new post' do
    post.should be_valid
  end

  it 'responds to proper methods' do
    post.should respond_to :user
    post.should respond_to :title
    post.should respond_to :body
  end

  it 'doesnt create new post if user is blank' do
    post.user = nil
    post.should_not be_valid
  end

  it 'doesnt create new post if title is blank' do
    post.title = nil
    post.should_not be_valid
  end

  it 'doesnt create new post if body is blank' do
    post.body = nil
    post.should_not be_valid
  end

end
