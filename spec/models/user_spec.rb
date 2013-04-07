require 'spec_helper'

describe User do

  let!(:user) { build :user }

  it 'creates new user' do
    user.should be_valid
    user.admin.should be_false
  end

  it 'responds to proper methods' do
    user.should respond_to :email
    user.should respond_to :password
    user.should respond_to :username
    user.should respond_to :posts
    user.should respond_to :admin
  end

  it 'doesnt create new user if username blank' do
    user.username = ''
    user.should_not be_valid
  end

end
