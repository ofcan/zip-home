require 'spec_helper'

describe BatchesController do
  
  let(:batch) { create :batch }
  let!(:founder) { create :founder }
  let!(:valid_attributes) { attributes_for :batch }

  context 'success' do

    it 'should get to show page' do
      get 'show', :id => batch
      response.should be_success
    end

    it 'should get to new page' do
      sign_in(founder)
      get 'new'
      response.should be_success
    end

    it 'should create new batch' do
      sign_in(founder)
      expect {
        post :create, :batch => valid_attributes
      }.to change(Batch, :count).by(1)
      response.should redirect_to startups_path
    end

    it 'should get edit page' do
      sign_in(founder)
      get :edit, :id => batch
      response.should be_success
    end

    it 'should update batch' do
      sign_in(founder)
      put :update, :id => batch, :batch => valid_attributes
      batch.reload
      batch.title.should == valid_attributes[:title]
      response.should redirect_to batch_path(batch)
      flash[:notice].should == 'Batch updated.'
    end

    # REFACTOR
    it 'should delete a batch' do
      sign_in(founder)
      post :create, :batch => valid_attributes
      expect {
        delete :destroy, :id => Batch.last
      }.to change(Batch, :count).by(-1)
      response.should redirect_to startups_path
      flash[:notice].should == 'Batch destroyed.'
    end

  end

  context 'failure' do

    it 'should not get to new page' do
      get 'new'
      response.should_not be_success
    end

    it 'should not create new batch given blank title' do
      sign_in(founder)
      expect {
        post :create, :batch => { :title => '' }
      }.to_not change(Batch, :count)
    end

  end

end
