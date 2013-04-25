require 'spec_helper'

describe 'BatchStartupJoins' do
  
  let!(:founder) { create :founder }
  let!(:batch) { create :batch }
  let!(:startup) { create :startup }
  let!(:batch_startup_join) { create :batch_startup_join }

  context 'success' do
    
    it 'founder should add startup to batch' do
      sign_in_as!(founder)
      visit edit_batch_path(batch)
      fill_in 'search', :with => startup.name
      click_button 'Search'

      current_path.should == edit_batch_path(batch)
      page.should have_content startup.name
      expect {
        click_link "create_batch_startup_join_with_startup_#{startup.id}"
      }.to change(BatchStartupJoin, :count).by(1)

      BatchStartupJoin.last.batch.should == batch
      BatchStartupJoin.last.startup.should == startup
    end

    it 'founder can remove startups from batch' do
      sign_in_as!(founder)
      visit edit_batch_path(batch_startup_join.batch)
      expect {
        click_link "remove_batch_startup_join_from_startup_#{batch_startup_join.startup.id}"
      }.to change(BatchStartupJoin, :count).by(-1)
    end
  end

  context 'failure' do
  end

end
