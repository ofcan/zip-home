require 'spec_helper'

describe StartupsController do
  
  let!(:user) { create :user }
  let!(:startup) { create :startup }
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

#    it 'should visit edit page' do
#      sign_in(user)
#      get 'edit', :id => startup
#      response.should be_success
#    end

  end

end
