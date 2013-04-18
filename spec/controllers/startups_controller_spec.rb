require 'spec_helper'

describe StartupsController do
  
  let!(:founder) { create :founder }
  let!(:user) { create :user }
  let!(:startup) { create :startup }
  let!(:startupship) { create :startupship }
  let!(:valid_attributes) { attributes_for :startup }

  context 'success' do
    
    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit show page and have proper variables' do
      get 'show', :id => startup
      response.should be_success
      assigns(:startup).should be_kind_of(Startup)
    end

    it 'should visit new page' do
      sign_in(user)
      get 'new'
      response.should be_success
      assigns(:startup).should be_kind_of(Startup)
    end

    it 'should create new startup given proper attributes' do
      sign_in(user)
      expect {
        post :create, :startup => valid_attributes
      }.to change(Startup, :count).by(1)
      flash[:notice].should == 'Startup created.'
      response.should redirect_to Startup.last
    end
    
    it 'should create new startupship when creating startup' do
      sign_in(user)
      expect {
        post :create, :startup => valid_attributes
      }.to change(Startupship, :count).by(1)
    end

    it 'should visit edit page if user is member of that startup' do
      sign_in(startupship.user)
      get 'edit', :id => startupship.startup
      response.should be_success
    end

    it 'should visit edit page if user is admin' do
      sign_in(founder)
      get 'edit', :id => startupship.startup
      response.should be_success
    end

    it 'founder should update startup given proper attributes' do
      sign_in(founder)
      put :update, :id => startup, :startup => valid_attributes
      startup.reload
      startup.name.should == valid_attributes[:name]
      startup.short_description.should == valid_attributes[:short_description]
      startup.long_description.should == valid_attributes[:long_description]
      response.should redirect_to startup
      flash[:notice].should == 'Startup updated.'
    end

    it 'user from that startup should update startup given proper attributes' do
      sign_in(startupship.user)
      put :update, :id => startupship.startup, :startup => valid_attributes
      startupship.startup.reload
      startupship.startup.name.should == valid_attributes[:name]
      startupship.startup.short_description.should == valid_attributes[:short_description]
      startupship.startup.long_description.should == valid_attributes[:long_description]
      response.should redirect_to startupship.startup
      flash[:notice].should == 'Startup updated.'
    end

  end

  context 'failure' do

    it 'should not visit new page if user is not logged in' do
      get 'new'
      response.should_not be_success
    end

    it 'should not create startup if user is not signed in' do
      expect {
        post :create, :startup => valid_attributes
      }.to_not change(Startup, :count)
    end

    it 'should not create startupship if user is not signed in' do
      expect {
        post :create, :startup => valid_attributes
      }.to_not change(Startupship, :count)
    end

    it 'should not visit edit page if user is not signed in' do
      get 'edit', :id => startupship.startup
      response.should_not be_success
    end

    it 'should not visit edit page if user is not admin or in that startup' do
      sign_in(user)
      get 'edit', :id => startupship.startup
      response.should_not be_success
    end

    it 'basic user should not update startup given proper attributes' do
      sign_in(user)
      put :update, :id => startup, :startup => valid_attributes
      startup.reload
      startup.name.should_not == valid_attributes[:name]
      startup.short_description.should_not == valid_attributes[:short_description]
      startup.long_description.should_not == valid_attributes[:long_description]
      flash[:alert].should == "You can't do that."
    end

  end

end
