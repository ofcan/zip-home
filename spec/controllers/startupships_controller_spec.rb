require 'spec_helper'

describe StartupshipsController do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
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

  end

  context 'failure' do

    it 'basic user should not visit index page' do
      sign_in(user)
      get 'index', :startup_id => startupship.startup
      response.should_not be_success
    end

  end

end
