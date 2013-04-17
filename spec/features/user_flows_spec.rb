# this file has been generated using command
# rails g integration_test user_flows

require 'spec_helper'

describe "UserFlows" do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:advisor) { create :advisor }
  let!(:mentor) { create :mentor }
  let!(:zip_team_member) { create :zip_team_member }

  before do
    @valid_attributes = attributes_for :user
  end

  it 'should sign up the user given valid attributes' do
    expect {
      visit root_path
      click_link 'Sign up'
      current_path.should == new_user_registration_path
      fill_in 'user_username', :with => @valid_attributes[:username]
      fill_in 'user_email', :with => @valid_attributes[:email]
      fill_in 'user_password', :with => @valid_attributes[:password]
      fill_in 'user_password_confirmation', :with => @valid_attributes[:password]
      click_button 'Sign up'
      page.should have_content 'success'
    }.to change(User, :count).by(1)
  end

  it 'should go to founder show page' do
    visit users_path
    click_link "user_#{founder.id}"
    current_path.should == user_path(founder)
  end

  it 'should go to advisor show page' do
    visit users_path
    click_link "user_#{advisor.id}"
    current_path.should == user_path(advisor)
  end

  it 'should go to mentor show page' do
    visit users_path
    click_link "user_#{mentor.id}"
    current_path.should == user_path(mentor)
  end

  it 'should go to zip_team_member show page' do
    visit users_path
    click_link "user_#{zip_team_member.id}"
    current_path.should == user_path(zip_team_member)
  end

end
