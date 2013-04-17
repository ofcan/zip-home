require 'spec_helper'

describe UsersController do
  
  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

  end

end
