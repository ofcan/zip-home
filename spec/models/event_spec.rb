require 'spec_helper'

describe Event do
  
  let!(:event) { build :event }

  context 'success' do

    it 'builds new event' do
      event.should be_valid
    end

    it 'responds to proper methods' do
      event.should respond_to :title
      event.should respond_to :description
      event.should respond_to :beginning
      event.should respond_to :ending
      event.should respond_to :location
      event.should respond_to :featured_image
      event.should respond_to :comments
    end

  end

  context 'failure' do

    it 'doesnt create new event if title is blank' do
      event.title = ''
      event.should_not be_valid
    end

    it 'doesnt create new event if description is blank' do
      event.description = ''
      event.should_not be_valid
    end

    it 'doesnt create new event if beginning is nil' do
      event.beginning = nil
      event.should_not be_valid
    end

    it 'doesnt create new event if location is nil' do
      event.location = nil
      event.should_not be_valid
    end

    it 'doesnt create new event if featured_image is nil' do
      event.featured_image = nil
      event.should_not be_valid
    end

    it 'doesnt create new event if ending is before beginning' do
      event.ending = event.beginning - 1
      event.should_not be_valid
    end

    it 'beginning cannot be in the past' do
      event.beginning = Time.now - 1
      event.should_not be_valid
    end

  end

end
