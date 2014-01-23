# spec/models/post_spec.rb
require 'spec_helper'
require 'factory_girl_rails'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a title"
  it "is valid if it is at least 5 characters long"
end
