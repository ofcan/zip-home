require 'spec_helper'

describe EventsController do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:event) { create :event }
  let!(:valid_attributes) { attributes_for :event }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit new page' do
      sign_in(founder)
      get 'new'
      response.should be_success
      assigns(:event).should be_kind_of(Event)
    end

    it 'should visit show page and have proper variables' do
      get 'show', :id => event
      response.should be_success
      assigns(:event).should be_kind_of(Event)
    end

    it 'should create new event given proper attributes' do
      sign_in(founder)
      expect {
        post :create, :event => valid_attributes
      }.to change(Event, :count).by(1)
      flash[:notice].should == 'Event created.'
      response.should redirect_to Event.last
    end

    it 'should visit edit page' do
      sign_in(founder)
      get 'edit', :id => event
      response.should be_success
    end

    it 'should update event given proper attributes' do
      sign_in(founder)
      put :update, :id => event, :event => valid_attributes
      event.reload
      event.title.should == valid_attributes[:title]
      event.description.should == valid_attributes[:description]
      event.location.should == valid_attributes[:location]
      response.should redirect_to event
      flash[:notice].should == 'Event updated.'
    end

    it 'should delete event' do
      sign_in(founder)
      expect {
        delete :destroy, :id => event
      }.to change(Event, :count).by(-1)
    end

  end

  context 'failure' do

    it 'should not visit new page' do
      get 'new'
      response.should_not be_success
    end

    it 'should not create new event' do
      expect {
        post :create, :event => valid_attributes
      }.to_not change(Event, :count)
    end

    it 'should not create event if ending is before beginning' do
      sign_in(founder)
      expect {
        post :create, :event => { title: valid_attributes[:title],
                                  description: valid_attributes[:description],
                                  beginning: valid_attributes[:beginning],
                                  ending: valid_attributes[:beginning] - 1 }
      }.to_not change(Event, :count)
    end

    it 'should not delete event if user is not founder' do
      sign_in(user)
      expect {
        delete :destroy, :id => event
      }.to_not change(Event, :count)
    end

  end

end
