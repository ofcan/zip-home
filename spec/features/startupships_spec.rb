require 'spec_helper'

describe 'Startupships' do
  
  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startupship) { create :startupship }
  let!(:startup) { create :startup }

  context 'success' do

    it 'startup member should be able to get to index from startup show' do
      sign_in_as!(startupship.user)
      visit startup_path(startupship.startup)
      click_link 'startup_startupships'
      current_path.should == startup_startupships_path(startupship.startup)
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
