# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:onid) {|n| "onidnum#{n}" }
  end
end
