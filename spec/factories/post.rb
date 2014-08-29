FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Group Title Number #{n}" }
    description "Description Text"
    location "Location Text"
    meeting_time DateTime.new(2012, 8, 29, 22, 35, 0)
    end_time DateTime.new(2014, 8, 29, 22, 35, 0)
    recipients nil
    onid "blah"

    trait :with_recipient do
      after(:build) do |post|
        post.recipients = "test@test.com"
      end
    end
  end
end
