include ActionDispatch::TestProcess

FactoryGirl.define do
  sequence :email do |n|
    "address#{n}@example.com"
  end

  sequence :name do |n|
    "Database Item #{n}"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  factory :user do
    name
    email
    password "HowAreYouToday"
    password_confirmation "HowAreYouToday"

    factory :admin do
      admin true
    end

  end


  factory :video do
    name
    slug
    publication_date Time.now
    video { fixture_file_upload(Rails.root.join(*%w[ spec support tiny_video.mp4 ]), 'video/mp4') }
    preview { fixture_file_upload(Rails.root.join(*%w[ spec support tiny_video_still.png ]), 'video/mp4') }
  end

  factory :purchase do
    association :user
    association :video
  end
end
