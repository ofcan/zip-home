require 'spec_helper'

describe StartupsController do
  
  let!(:user) { create :user }
  let!(:startup) { create :startup }

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

  end

end
