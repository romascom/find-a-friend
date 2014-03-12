require 'spec_helper'
require 'factory_girl_rails'

# Would a spec that checks for all elements that should exist in a web page be overkill?

describe "list" do
  before :each do
    Capybara.current_driver = :webkit # temporarily select different driver
  end
  
  it "should update automatically" do
    visit('/posts');
    find('#accordion').should_not have_css('panel panel-default')
    FactoryGirl.create(:post, title: "test_post", description: "test_description")
    find('#accordion').should have_css('panel panel-default')
  end
end

describe "post" do
  before :each do
    Capybara.current_driver = :webkit # temporarily select different driver
    FactoryGirl.create(:post, title: "test_post", description: "test_description", meeting_time: "", expire_time: "")
    visit('/posts');
  end

  it "contains a complete header" do
    find('#accordion').within(:css, 'h4') do
      should have_content("test_post")
      should have_content("Edit") # I think this should be moved to description area
      should have_content("")
    end
  end
  
  it "nonviewable if too old" do
    
  end
end

describe "the post creation process" do
  before :each do
    visit('/posts')
  end

  it "adds a new post to page" do
    click_link('New post')
    #save_and_open_page
    within(:css, "form#new_post") do
      fill_in('post[title]', :with => 'New title')
      fill_in('post[description]', :with => 'New description')
      click_button 'Create Post'
    end
    page.should have_content('New title')
    page.should have_content('New description')
    page.should have_no_content('Create Post')
  end
end

describe "the user", :js => true do
  before :each do
    Capybara.current_driver = :webkit # temporarily select different driver
    FactoryGirl.create(:post, title: "test_post", description: "test_description")
    visit('/posts');
  end
  
  it "edits a post" do
    find('#accordion').click_link('Edit')
    within(:css, "form#edit_post_1") do #may be incorrect id
      fill_in('post[title]', :with => 'Some title')
      fill_in('post[description]', :with => 'Some description')
      click_button 'Update Post'
    end
    page.should have_content('Some title')
click_link('Some title')
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
