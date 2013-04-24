require 'spec_helper'

describe Startup do

  let!(:startup) { create :startup }
  let!(:another_startup) { create :startup }

  context 'success' do

    it 'creates new startup' do
      startup.should be_valid
    end

    it 'should respond to proper methods' do
      startup.should respond_to :name
      startup.should respond_to :short_description
      startup.should respond_to :long_description

      startup.should respond_to :startupships
      startup.should respond_to :users
      startup.should respond_to :batch_startup_joins
      startup.should respond_to :batches
    end

  end

  context 'failure' do

    it 'doesnt create new startup if name is blank' do
      startup.name = ''
      startup.should_not be_valid
    end

    it 'doesnt create new startup if short_description is blank' do
      startup.short_description = ''
      startup.should_not be_valid
    end

    it 'doesnt create new startup if long_description is blank' do
      startup.long_description = ''
      startup.should_not be_valid
    end

    it 'doesnt create new startup with name wich already exists' do
      another_startup.name = startup.name
      another_startup.should_not be_valid
    end

  end

end
