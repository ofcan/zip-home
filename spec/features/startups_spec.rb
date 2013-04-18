require 'spec_helper'

describe 'Startups' do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startup) { create :startup }
  let!(:valid_attributes) { attributes_for :startup }

  context 'success' do

    it 'should get to startups index from home page' do
      visit root_path
      click_link 'Startups'
      current_path.should == startups_path
    end

    it 'should get to startup show from index' do
      visit startups_path
      click_link "#{startup.name}"
      current_path.should == startup_path(startup)
    end

    it 'should get to event new from event index' do
      sign_in_as!(user)
      visit startups_path
      click_link 'new_startup'
      current_path.should == new_startup_path
    end

    it 'should create new startup' do
      sign_in_as!(user)
      visit new_startup_path
      fill_in 'startup_name', :with => valid_attributes[:name]
      fill_in 'startup_short_description', :with => valid_attributes[:short_description]
      fill_in 'startup_long_description', :with => valid_attributes[:long_description]
      expect {
        click_button 'Create'
      }.to change(Startup, :count).by(1)
      current_path.should == startup_path(Startup.last)
    end

  end

  context 'failure' do
    
    it 'not signed in user should not see links for new startups on index' do
      visit startups_path
      page.should_not have_link 'new_startup'
    end

  end

end
