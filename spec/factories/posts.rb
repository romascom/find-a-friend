# spec/factories/posts.rb
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { "This is a title" }
    f.description { Faker::Name.last_name }
    #title "THE BEST TITLE EVER"
  end
end
