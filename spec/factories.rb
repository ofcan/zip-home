FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'user_password'
    sequence(:username) { |n| "user_username_#{n}" }
  end

end
