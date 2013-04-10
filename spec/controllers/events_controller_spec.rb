require 'spec_helper'

describe EventsController do

  let!(:event) { create :event }

  context 'success' do

    it 'should visit index page' do
      get 'index'
      response.should be_success
    end

  end

end
