# spec/factories/posts.rb
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Name.first_name }
    f.description { Faker::Name.last_name }
    #title "THE BEST TITLE EVER"
  end
end
