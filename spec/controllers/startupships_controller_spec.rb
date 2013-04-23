require 'spec_helper'

describe StartupshipsController do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startup) { create :startup }
  let!(:startupship) { create :startupship }

  context 'success' do

    it 'startup member should visit index page' do
      sign_in(startupship.user)
      get :index, :startup_id => startupship.startup
      response.should be_success
    end

    it 'admin should visit index page' do
      sign_in(founder)
      get :index, :startup_id => startupship.startup
      response.should be_success
    end

    it 'startup member can add new members' do
      sign_in(startupship.user)
      expect {
        post :create, :startup_id => startupship.startup,
                      :startupship => { :user_id => user }
      }.to change(Startupship, :count).by(1)
      response.should redirect_to startup_startupships_path(startupship.startup)
      flash[:notice].should == 'Member added.'
    end

    it 'admin can add new members' do
      sign_in(founder)
      expect {
        post :create, :startup_id => startup,
                      :startupship => { :user_id => user }
      }.to change(Startupship, :count).by(1)
      response.should redirect_to startup_startupships_path(startup)
      flash[:notice].should == 'Member added.'
    end

    it 'startup member can remove members' do
      sign_in(startupship.user)
      expect {
        delete :destroy, :startup_id => startupship.startup,
                         :id => startupship
      }.to change(Startupship, :count).by(-1)
      response.should redirect_to startup_startupships_path(startupship.startup)
      flash[:notice].should == 'Member removed.'
    end

    it 'admin can remove members' do
      sign_in(founder)
      expect {
        delete :destroy, :startup_id => startupship.startup,
                         :id => startupship
      }.to change(Startupship, :count).by(-1)
      response.should redirect_to startup_startupships_path(startupship.startup)
      flash[:notice].should == 'Member removed.'
    end

  end

  context 'failure' do

    it 'basic user should not visit index page' do
      sign_in(user)
      get 'index', :startup_id => startupship.startup
      response.should_not be_success
    end

    it 'basic user cannot add new members' do
      sign_in(user)
      expect {
        post :create, :startup_id => startup,
                      :startupship => { :user_id => user }
      }.to_not change(Startupship, :count)
      response.should redirect_to startups_path
      flash[:alert].should == "You can't do that."
    end

    it 'basic user cannot add new members' do
      sign_in(user)
      expect {
        delete :destroy, :startup_id => startupship.startup,
                         :id => startupship
      }.to_not change(Startupship, :count)
      response.should redirect_to startups_path
      flash[:alert].should == "You can't do that."
    end

  end

end
