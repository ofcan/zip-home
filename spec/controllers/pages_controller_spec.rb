require 'spec_helper'

describe PagesController do

  it 'can visit home page' do
    get 'index'
    response.should be_success
  end

  it 'can visit startups page' do
    get 'startups'
    response.should be_success
  end

  it 'can visit partners page' do
    get 'partners'
    response.should be_success
  end

  it 'can visit coworking page' do
    get 'coworking'
    response.should be_success
  end

  it 'can visit contact page' do
    get 'contact'
    response.should be_success
  end

end
