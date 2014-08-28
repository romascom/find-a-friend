require 'spec_helper'

describe 'Posts' do
	let(:user) {create(:user)}
	let(:post) {create(:post)}

	context "When logged in" do
		before do
    	RubyCAS::Filter.fake(user.onid)
    	visit signin_path
    	visit root_path
  	end

    context "and trying to create a new post" do
    	before do
    		click_link "New post"
    	end

    	context "after filling all the forms out" do
    		before do
    			fill_in "Title", :with => "Test Title"
    			fill_in "Description", :with => "Test Description"
    			fill_in "Location", :with => "Test Location"
    			click_button "Create Post"
    		end

    		it "should save and display it" do
    			expect(page).to have_content("Test Title")
    			expect(page).to have_content("Test Description")
    			expect(page).to have_content("Test Location")
    		end
    		context "When trying to edit a post" do
    			before do
    				click_link "Edit"
    			end

    			context "should let you fill out new information" do
    				before do
    					fill_in "Description", :with => "New Description"
    					click_button "Update Post"
    				end

    				it "should display the new information" do
    					expect(page).to have_content("New Description") 
    				end
    			end
    		end
    		context "When trying to delete the post" do
    			before do
    				click_link "Delete"
    			end

    			it "should be deleted" do
    				expect(Post.count).to eq 0
    			end
    		end
    	end
    end
	end
	context "When not logged in" do

		context "and trying to create a new post" do
			before do
				visit root_path
				click_link "New post"
			end

			it "should give you an insufficient permissions error" do
				expect(page).to have_content(I18n.t("permission_error.error_string"))
			end
		end
		context "when trying to edit a post" do
			before do
				visit edit_post_path(post.id)
			end

			it "should give you an insufficient permissions error" do
				expect(page).to have_content(I18n.t("permission_error.error_string"))
			end
		end
	end

end
