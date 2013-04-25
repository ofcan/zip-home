require 'spec_helper'

describe BatchStartupJoinsController do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:startup) { create :startup }
  let!(:startupship) { create :startupship }
  let!(:batch) { create :batch }
  let!(:batch_startup_join) { create :batch_startup_join }

  context 'success' do

    it 'founder should create new batch_startup_join' do
      sign_in(founder)
      expect {
        post :create, :batch_id => batch,
                      :batch_startup_join => { :startup_id => startup }
      }.to change(BatchStartupJoin, :count).by(1)
      response.should redirect_to edit_batch_path(batch)
      flash[:notice].should == 'Startup added.'
    end

    it 'founder should delete batch_startup_join' do
      sign_in(founder)
      expect {
        delete :destroy, :batch_id => batch_startup_join.batch,
                         :id => batch_startup_join
      }.to change(BatchStartupJoin, :count).by(-1)
      response.should redirect_to edit_batch_path(batch_startup_join.batch)
      flash[:notice].should == 'Startup removed.'
    end

  end

  context 'failure' do
    
    it 'basic user should not create batch_startup_join' do
      sign_in(user)
      expect {
        post :create, :batch_id => batch,
                      :batch_startup_join => { :startup_id => startup }
      }.to_not change(BatchStartupJoin, :count)
    end

    it 'startup member should not create new batch_startup_join' do
      sign_in(startupship.user)
      expect {
        post :create, :batch_id => batch,
                      :batch_startup_join => { :startup_id => startupship.startup }
      }.to_not change(BatchStartupJoin, :count)
    end

  end

end
