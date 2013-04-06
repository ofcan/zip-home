require 'spec_helper.rb'

describe "Navigation" do

  describe 'Bootstrap navbar' do

    it 'should get to startups page from home page' do
      visit root_path
      click_link 'Startups'
      current_path.should == startups_path
    end

    it 'should get to people page from home page' do
      visit root_path
      click_link 'People'
      current_path.should == people_path
    end

    it 'should get to partners page from home page' do
      visit root_path
      click_link 'Partners'
      current_path.should == partners_path
    end

    it 'should get to coworking page from home page' do
      visit root_path
      click_link 'Coworking'
      current_path.should == coworking_path
    end

    it 'should get to contact page from home page' do
      visit root_path
      click_link 'Contact'
      current_path.should == contact_path
    end

  end

end
