require 'spec_helper'

describe UsersController do
  
  let!(:founder) { create :founder }
  let!(:user) { create :user }
  let!(:another_user) { create :user }
  let!(:valid_attributes) { attributes_for :user }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit show page' do
      get 'show', :id => founder
      response.should be_success
    end

    it 'should update user role' do
      sign_in(founder)
      put :update, :id => user, :user => { :role => 'advisor' }
      user.reload
      user.role.should == 'advisor'
    end

  end

  context 'failure' do

    it 'should not update user role' do
      sign_in(user)
      put :update, :id => another_user, :user => { :role => 'advisor' }
      another_user.reload
      another_user.role.should_not == 'advisor'
    end
  end

end
