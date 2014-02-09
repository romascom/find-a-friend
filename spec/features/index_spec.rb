require 'spec_helper'

describe "Home page" do
  before do
    visit('/posts')
  end

  it "adds a new post to page" do
    click_link('New post')
    save_and_open_page
    within(:css, "form#new_post") do
      fill_in('post[title]', :with => 'Some title')
      fill_in('post[description]', :with => 'Some description')
      click_button 'Create Post'
    end
    click_link('Back')
    page.should have_content('Some title')
    page.should have_content('Some description')
  end
end
