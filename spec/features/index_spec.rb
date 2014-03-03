require 'spec_helper'
require 'factory_girl_rails'

# Would a spec that checks for all elements that should exist in a web page be overkill?

describe "the post creation process" do
  before :each do
    visit('/posts')
  end

  it "adds a new post to page" do
    click_link('New post')
    #save_and_open_page
    within(:css, "form#new_post") do
      fill_in('post[title]', :with => 'Some title')
      fill_in('post[description]', :with => 'Some description')
      click_button 'Create Post'
    end
    page.should have_content('Some title')
    page.should have_content('Some description')
    page.should have_no_content('Create Post')
  end
end

describe "the home page", :js => true do
  before :each do
    Capybara.current_driver = :webkit # temporarily select different driver
    FactoryGirl.create(:post, title: "test_post", description: "test_description")
    visit('/posts');
  end
  
  it "edits a post" do
    click_link('Edit')
    within(:css, "form#new_post") do #may be incorrect id
      fill_in('post[title]', :with => 'Some title')
      fill_in('post[description]', :with => 'Some description')
      click_button 'Create Post'
    end
    page.should have_content('Some title')
    page.should have_content('Some description')
  end  
  
  it "expands a post" do
    click_link('New post')
    #save_and_open_page
    within(:css, "form#new_post") do
      fill_in('post[title]', :with => 'Some title')
      fill_in('post[description]', :with => 'Some description')
      click_button 'Create Post'
    end
    #within('#accordion') do
      #find('#collapse-post_1').should have_content('test_post') # It doesn't seem like the post is created
      #page.should have_no_content('test_description')
      
    visit('/posts');
      click_link('Some title')
      page.should have_content('Some description')
      #page.should have_content('test_description')
    #end
  end
end
