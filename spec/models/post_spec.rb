# spec/models/post_spec.rb
require 'spec_helper'
require 'factory_girl_rails'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end
  it "is invalid if its title is less than 5 characters long" do
    FactoryGirl.build(:post, title: "WHAT").should_not be_valid
  end
  it "is valid without a description" do
    FactoryGirl.build(:post, description: nil).should be_valid
  end
  it "is valid if its title is at least 5 characters long" do
    FactoryGirl.build(:post, title: "candy").should be_valid
  end
end
