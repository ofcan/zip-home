require 'spec_helper'

describe BatchStartupJoin do
  
  let!(:batch_startup_join) { build :batch_startup_join }

  context 'success' do

    it 'builds new batch startup join' do
      batch_startup_join.should be_valid
    end

  end

  context 'failure' do
    
    it 'doesnt create new batch startup join without batch' do
      batch_startup_join.batch = nil
      batch_startup_join.should_not be_valid
    end

    it 'doesnt create new batch startup join without startup' do
      batch_startup_join.startup = nil
      batch_startup_join.should_not be_valid
    end

  end

end
