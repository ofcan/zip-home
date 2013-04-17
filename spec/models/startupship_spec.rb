require 'spec_helper'

describe Startupship do
  
  let!(:startupship) { build :startupship }

  it 'builds new startupship' do
    startupship.should be_valid
  end

  it 'should respond to proper methods' do
    startupship.should respond_to :user
    startupship.should respond_to :startup
  end

end
