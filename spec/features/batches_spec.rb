require 'spec_helper'

describe 'Batches' do

  let!(:batch) { create :batch }
  let!(:founder) { create :founder }
  let!(:user) { create :user }
  let!(:valid_attributes) { attributes_for :batch }

  context 'success' do

    it 'should get to new from startups index' do
      sign_in_as!(founder)
      visit startups_path
      click_link 'new_batch'
      current_path.should == new_batch_path
    end

    it 'should create new batch' do
      sign_in_as!(founder)
      visit new_batch_path
      fill_in :batch_title, :with => valid_attributes[:title]
      expect {
        click_button 'Create'
      }.to change(Batch, :count).by(1)
      current_path.should == startups_path
    end

    it 'should get to edit from startups index' do
      sign_in_as!(founder)
      visit startups_path
      click_link "edit_batch_#{batch.id}"
      current_path.should == edit_batch_path(batch)
    end

  end

  context 'failure' do

    it 'basic user should not see link for new batch on startup index' do
      sign_in_as!(user)
      visit startups_path
      page.should_not have_link 'new_batch'
    end

  end

end
