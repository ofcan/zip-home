require 'spec_helper'

describe PagesController do

  it 'can visit home page' do
    get 'index'
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

  it 'can visit apply page' do
    get 'apply'
    response.should be_success
  end

end
