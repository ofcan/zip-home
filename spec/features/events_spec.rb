require 'spec_helper'

describe 'Events' do

  let!(:admin) { create :admin }
  let!(:valid_attributes) { attributes_for :event }

  context 'success' do

    it 'should get to events index from home page' do
      visit root_path
      click_link 'Events'
      current_path.should == events_path
    end

    it 'should get to event new from event index' do
      sign_in_as!(admin)
      visit events_path
      click_link 'new_event'
      current_path.should == new_event_path
    end

    it 'should create new event' do
      sign_in_as!(admin)
      visit new_event_path
      fill_in 'event_title', :with => valid_attributes[:title]
      fill_in 'event_description', :with => valid_attributes[:description]
      fill_in 'event_beginning', :with => valid_attributes[:beginning]
      expect {
        click_button 'Create'
      }.to change(Event, :count).by(1)
      current_path.should == event_path(Event.last)
    end

  end

end
