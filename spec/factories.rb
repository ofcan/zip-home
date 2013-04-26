FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'user_password'
    sequence(:username) { |n| "user_username_#{n}" }
    sequence(:realname) { |n| "user_realname_#{n}" }
    sequence(:bio) { |n| "user_bio_#{n}" }
    factory :founder do
      role 'founder'
    end
    factory :advisor do
      role 'advisor'
    end
    factory :mentor do
      role 'mentor'
    end
    factory :zip_team_member do
      role 'zip_team_member'
    end
  end

  factory :post do
    user
    sequence(:title) { |n| "post_title_#{n}" }
    sequence(:body) { |n| "post_body_#{n}" }
    # FeaturedImage attribute provided by Paperclip gem
    featured_image_file_name { 'test_featured_image.png' }
    featured_image_content_type { 'image/png' }
    featured_image_file_size { 1024 }
  end

  factory :event do
    sequence(:title) { |n| "event_title_#{n}" }
    sequence(:description) { |n| "event_description_#{n}" }
    sequence(:location) { |n| "event_location_#{n}" }
    sequence(:beginning) { |n| Time.now + n*60 } # n minutes
    sequence(:ending) { |n| Time.now + (n+60)*60 } # 60 minutes after beginning
    # FeaturedImage attribute provided by Paperclip gem
    featured_image_file_name { 'test_featured_image.png' }
    featured_image_content_type { 'image/png' }
    featured_image_file_size { 1024 }
  end

  factory :startup do
    sequence(:name) { |n| "startup_name_#{n}" }
    sequence(:short_description) { |n| "startup_short_description_#{n}" }
    sequence(:long_description) { |n| "startup_long_description_#{n}" }
    # Logo attribute provided by Paperclip gem
    logo_file_name { 'test_logo.png' }
    logo_content_type { 'image/png' }
    logo_file_size { 1024 }
  end

  factory :startupship do
    user
    startup
  end

  factory :batch do
    sequence(:title) { |n| "batch_title_#{n}" }
  end

  factory :batch_startup_join do
    batch
    startup
  end

end
