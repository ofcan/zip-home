require 'spec_helper'

describe 'Events' do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:event) { create :event }
  let!(:valid_attributes) { attributes_for :event }

  context 'success' do

    it 'should get to events index from home page' do
      visit root_path
      click_link 'Events'
      current_path.should == events_path
    end

    it 'should get to event show from index' do
      visit events_path
      click_link "#{event.title}"
      current_path.should == event_path(event)
    end

    it 'should get to event new from event index' do
      sign_in_as!(founder)
      visit events_path
      click_link 'new_event'
      current_path.should == new_event_path
    end

    it 'should create new event' do
      sign_in_as!(founder)
      visit new_event_path
      fill_in 'event_title', :with => valid_attributes[:title]
      fill_in 'event_description', :with => valid_attributes[:description]
      fill_in 'event_beginning', :with => valid_attributes[:beginning]
      fill_in 'event_location', :with => valid_attributes[:location]
      expect {
        click_button 'Create'
      }.to change(Event, :count).by(1)
      current_path.should == event_path(Event.last)
    end

    it 'should get to event edit page from index' do
      sign_in_as!(founder)
      visit events_path
      click_link "edit_event_#{event.id}"
      current_path.should == edit_event_path(event)
    end

    it 'should get to event edit page from show' do
      sign_in_as!(founder)
      visit event_path(event)
      click_link "edit_event_#{event.id}"
      current_path.should == edit_event_path(event)
    end

    it 'should update event' do
      sign_in_as!(founder)
      visit edit_event_path(event)
      fill_in 'event_title', :with => valid_attributes[:title]
      fill_in 'event_description', :with => valid_attributes[:description]
      fill_in 'event_location', :with => valid_attributes[:location]
      click_button 'Update'
      event.reload
      event.title.should == valid_attributes[:title]
      event.description.should == valid_attributes[:description]
      event.location.should == valid_attributes[:location]
      current_path.should == event_path(event)
      page.should have_content 'Event updated.'
    end

    it 'should delete event from index' do
      sign_in_as!(founder)
      visit events_path
      expect {
        click_link "delete_event_#{event.id}"
      }.to change(Event, :count).by(-1)
    end

    it 'should delete event from show' do
      sign_in_as!(founder)
      visit event_path(event)
      expect {
        click_link "delete_event_#{event.id}"
      }.to change(Event, :count).by(-1)
    end

  end

  context 'failure' do
    
    it 'normal user should not see links for new/edit/delete events on index' do
      sign_in_as!(user)
      visit events_path
      page.should_not have_link 'new_event'
      page.should_not have_link "edit_event_#{event.id}"
      page.should_not have_link "delete_event_#{event.id}"
    end

    it 'should not see links for edit/delete events on show' do
      sign_in_as!(user)
      visit event_path(event)
      page.should_not have_link "edit_event_#{event.id}"
      page.should_not have_link "delete_event_#{event.id}"
    end

  end

end
