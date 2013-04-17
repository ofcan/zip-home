require 'spec_helper'

describe UsersController do
  
  let!(:founder) { create :founder }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

    it 'should visit show page' do
      get 'show', :id => founder
      response.should be_success
    end

  end

end
