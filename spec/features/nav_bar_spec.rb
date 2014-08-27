require 'spec_helper'

describe 'navbar' do
  
  before do
    visit root_path
  end

  context "when browsing the home page" do    
    it "should have the nav bar on the top of the page" do
      expect(page).to have_selector('.navbar')
    end
    context "When using the nav bar" do      
      context "When clicking the home button" do
        before do
          click_link "Home"
        end
        it "should route back to the home page" do
          expect(location).to eq root_path
        end
      end
      context "when clicking the new post button" do
        before do
          click_link "New post"
        end
        xit "should take you to the new posts page" do
          expect(page).to have_content("New Post")
        end
      end
      context "when clicking the sign in button" do
        xit "should route you to CAS for OSU login" do
          expect(page).to have_content("OSU Central Login")
        end
      end
    end
  end
end
