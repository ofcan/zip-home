require 'spec_helper'

describe BatchesController do
  
  let(:batch) { create :batch }
  let!(:founder) { create :founder }
  let!(:valid_attributes) { attributes_for :batch }

  context 'success' do

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
