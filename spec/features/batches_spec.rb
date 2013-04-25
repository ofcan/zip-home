require 'spec_helper'

describe 'Batches' do

  let!(:batch) { create :batch }
  let!(:founder) { create :founder }
  let!(:user) { create :user }
  let!(:valid_attributes) { attributes_for :batch }
  let!(:startup) { create :startup }

  context 'success' do

    it 'should get to show from startups index' do
      sign_in_as!(founder)
      visit startups_path
      click_link batch.title
      current_path.should == batch_path(batch)
    end

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

    it 'should get to edit from show' do
      sign_in_as!(founder)
      visit batch_path(batch)
      click_link "edit_batch_#{batch.id}"
      current_path.should == edit_batch_path(batch)
    end

    it 'should update batch' do
      sign_in_as!(founder)
      visit edit_batch_path(batch)
      fill_in 'batch_title', :with => valid_attributes[:title]
      click_button 'Update'
      batch.reload
      batch.title.should == valid_attributes[:title]
      current_path.should == batch_path(batch)
      page.should have_content 'Batch updated.'
    end

    it 'should delete batch from show' do
      sign_in_as!(founder)
      visit batch_path(batch)
      expect {
        click_link "delete_batch_#{batch.id}"
      }.to change(Batch, :count).by(-1)
    end

    it 'should be able to search for startups on edit page' do
      sign_in_as!(founder)
      visit edit_batch_path(batch)
      fill_in 'search', :with => startup.name
      click_button 'Search'
      page.should have_content startup.name
      page.should have_content startup.short_description
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
