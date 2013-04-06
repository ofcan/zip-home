require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.build :user }

  it 'creates new user' do
    user.should be_valid
  end

  it 'responds to proper methods' do
    user.should respond_to :email
    user.should respond_to :password
  end

end
