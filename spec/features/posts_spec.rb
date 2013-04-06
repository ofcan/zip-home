require 'spec_helper'

describe "UserFlows" do
  
  it 'should get to posts index from home page' do
    visit root_path
    click_link 'Blog'
    current_path.should == posts_path
  end

end
