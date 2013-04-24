require 'spec_helper'

describe Batch do
  
  let!(:batch) { build :batch }
  
  context 'success' do

    it 'builds new batch' do
      batch.should be_valid
    end

    it 'responds to proper methods' do
      batch.should respond_to(:title)
      batch.should respond_to(:startups)
    end

  end

  context 'failure' do

    it 'cannot have blank title' do
      batch.title = ''
      batch.should_not be_valid
    end

  end

end
