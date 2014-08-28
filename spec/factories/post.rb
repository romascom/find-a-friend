FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Group Title Number #{n}" }
    description "Description Text"
    meeting_time "2014-07-02 13:58:43"
    expire_time "3014-07-02 13:58:43"
    x 0
    y 0
    recipients nil
    user_id 500000

    trait :with_recipient do
      after(:build) do |post|
        post.recipients = "test@test.com"
      end
    end
  end
end
