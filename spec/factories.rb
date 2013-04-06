FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'user_password'
    sequence(:username) { |n| "user_username_#{n}" }
  end

  factory :post do
    user
    sequence(:title) { |n| "post_title_#{n}" }
    sequence(:body) { |n| "post_body_#{n}" }
  end

end
