require 'spec_helper'

describe EventsController do

  let!(:admin) { create :admin }
  let!(:event) { create :event }
  let!(:valid_attributes) { attributes_for :event }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit new page' do
      sign_in(admin)
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
      sign_in(admin)
      expect {
        post :create, :event => valid_attributes
      }.to change(Event, :count).by(1)
      flash[:notice].should == 'Event created.'
      response.should redirect_to Event.last
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
      sign_in(admin)
      expect {
        post :create, :event => { title: valid_attributes[:title],
                                  description: valid_attributes[:description],
                                  beginning: valid_attributes[:beginning],
                                  ending: valid_attributes[:beginning] - 1 }
      }.to_not change(Event, :count)
    end

  end

end
