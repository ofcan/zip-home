require 'spec_helper'

describe Startup do
  let!(:startup) { build :startup }

  it 'creates new startup' do
    startup.should be_valid
  end

  it 'should respond to proper methods' do
    startup.should respond_to :name
    startup.should respond_to :short_description
    startup.should respond_to :long_description
  end

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

end
