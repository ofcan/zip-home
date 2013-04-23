require 'spec_helper'

describe 'Startups' do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startup) { create :startup }
  let!(:startupship) { create :startupship }
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
      attach_file('startup_logo', Rails.root.join('app', 'assets', 'images', 'startups', 'mashme_logo.png'))
      expect {
        click_button 'Create'
      }.to change(Startup, :count).by(1)
      current_path.should == startup_path(Startup.last)
    end

    it 'founder should get to startup edit page from show' do
      sign_in_as!(founder)
      visit startup_path(startup)
      click_link "edit_startup_#{startup.id}"
      current_path.should == edit_startup_path(startup)
    end

    it 'startup member should get to startup edit page from show' do
      sign_in_as!(startupship.user)
      visit startup_path(startupship.startup)
      click_link "edit_startup_#{startupship.startup.id}"
      current_path.should == edit_startup_path(startupship.startup)
    end

    it 'founder should update startup' do
      sign_in_as!(founder)
      visit edit_startup_path(startup)
      fill_in 'startup_name', :with => valid_attributes[:name]
      fill_in 'startup_short_description', :with => valid_attributes[:short_description]
      fill_in 'startup_long_description', :with => valid_attributes[:long_description]
      click_button 'Update'
      startup.reload
      startup.name.should == valid_attributes[:name]
      startup.short_description.should == valid_attributes[:short_description]
      startup.long_description.should == valid_attributes[:long_description]
      current_path.should == startup_path(startup)
      page.should have_content 'Startup updated.'
    end

    it 'startup member should update startup' do
      sign_in_as!(startupship.user)
      visit edit_startup_path(startupship.startup)
      fill_in 'startup_name', :with => valid_attributes[:name]
      fill_in 'startup_short_description', :with => valid_attributes[:short_description]
      fill_in 'startup_long_description', :with => valid_attributes[:long_description]
      click_button 'Update'
      startupship.startup.reload
      startupship.startup.name.should == valid_attributes[:name]
      startupship.startup.short_description.should == valid_attributes[:short_description]
      startupship.startup.long_description.should == valid_attributes[:long_description]
      current_path.should == startup_path(startupship.startup)
      page.should have_content 'Startup updated.'
    end

    it 'founder should delete startup from show' do
      sign_in_as!(founder)
      visit startup_path(startup)
      expect {
        click_link "delete_startup_#{startup.id}"
      }.to change(Startup, :count).by(-1)
    end

    it 'startup member should delete startup from show' do
      sign_in_as!(startupship.user)
      visit startup_path(startupship.startup)
      expect {
        click_link "delete_startup_#{startupship.startup.id}"
      }.to change(Startup, :count).by(-1)
    end

  end

  context 'failure' do
    
    it 'not signed in user should not see links for new startups on index' do
      visit startups_path
      page.should_not have_link 'new_startup'
      page.should_not have_link "edit_startup_#{startup.id}"
      page.should_not have_link "delete_startup_#{startup.id}"
    end

    it 'should not create new startup' do
      sign_in_as!(user)
      visit new_startup_path
      fill_in 'startup_name', :with => ''
      fill_in 'startup_short_description', :with => ''
      fill_in 'startup_long_description', :with => ''
      expect {
        click_button 'Create'
      }.to_not change(Startup, :count)
      current_path.should == startups_path
    end


  end

end
