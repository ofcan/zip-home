require 'spec_helper'

describe User do

  let!(:user) { build :user }
  let!(:founder) { build :founder }
  let!(:zip_team_member) { build :zip_team_member }
  let!(:advisor) { build :advisor }
  let!(:mentor) { build :mentor }

  it 'creates new user' do
    user.should be_valid
    user.admin.should be_false
    user.role.should == 'basic'
  end

  it 'responds to proper methods' do
    user.should respond_to :email
    user.should respond_to :password
    user.should respond_to :username
    user.should respond_to :posts
    user.should respond_to :role
    user.should respond_to :bio
    user.should respond_to :realname

    user.should respond_to :admin
  end

  it 'doesnt create new user if username blank' do
    user.username = ''
    user.should_not be_valid
  end

  it 'founder and zip_team_member should be admin' do
    founder.admin.should be_true
    zip_team_member.admin.should be_true
  end

  it 'advisor, mentor and basic should not be admin' do
    advisor.admin.should be_false
    mentor.admin.should be_false
    user.admin.should be_false
  end

  it 'cannot create user with role that is not in User::ROLES' do
    user.role = 'non_existant_role'
    user.should_not be_valid
  end

end
