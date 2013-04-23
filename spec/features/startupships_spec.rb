require 'spec_helper'

describe 'Startupships' do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startupship) { create :startupship }
  let!(:startup) { create :startup }

  let!(:another_user) { create :user }
  let!(:another_startupship) { create :startupship,
                                      :user => another_user,
                                      :startup => startupship.startup }

  context 'success' do

    it 'startup member should be able to get to index from startup show' do
      sign_in_as!(startupship.user)
      visit startup_path(startupship.startup)
      click_link 'startup_startupships'
      current_path.should == startup_startupships_path(startupship.startup)
    end

    it 'startups member should be able to add new members' do
      sign_in_as!(startupship.user)
      visit startup_startupships_path(startupship.startup)
      fill_in 'search', :with => user.username
      click_button 'Search'

      current_path.should == startup_startupships_path(startupship.startup)
      page.should have_content user.username
      expect {
        click_link "create_startupship_with_user_#{user.id}"
      }.to change(Startupship, :count).by(1)

      Startupship.last.user.should == user
      Startupship.last.startup.should == startupship.startup
    end

    it 'founder should be able to add new members' do
      sign_in_as!(founder)
      visit startup_startupships_path(startupship.startup)
      fill_in 'search', :with => user.username
      click_button 'Search'

      current_path.should == startup_startupships_path(startupship.startup)
      page.should have_content user.username
      expect {
        click_link "create_startupship_with_user_#{user.id}"
      }.to change(Startupship, :count).by(1)

      Startupship.last.user.should == user
      Startupship.last.startup.should == startupship.startup
    end

    it 'startup member can remove members' do
      sign_in_as!(startupship.user)
      visit startup_startupships_path(startupship.startup)
      expect {
        click_link "remove_startupship_from_user_#{another_user.id}"
      }.to change(Startupship, :count).by(-1)
      current_path.should == startup_startupships_path(startupship.startup)
      page.should have_content 'Member removed.'
    end

    it 'founder can remove members' do
      sign_in_as!(founder)
      visit startup_startupships_path(startupship.startup)
      expect {
        click_link "remove_startupship_from_user_#{another_user.id}"
      }.to change(Startupship, :count).by(-1)
      current_path.should == startup_startupships_path(startupship.startup)
      page.should have_content 'Member removed.'
    end

    it 'adding existing member to members doesnt create additionas Startupships' do
      sign_in_as!(startupship.user)
      visit startup_startupships_path(startupship.startup)
      fill_in 'search', :with => startupship.user.username
      click_button 'Search'

      current_path.should == startup_startupships_path(startupship.startup)
      expect {
        click_link "create_startupship_with_user_#{startupship.user.id}"
      }.to_not change(Startupship, :count)
    end

  end

  context 'failure' do

    it 'basic user should not see link for startupships on startup show' do
      sign_in_as!(user)
      visit startup_path(startup)
      page.should_not have_link 'startup_startupships'
    end

  end

end
