require 'spec_helper'
require 'factory_girl_rails'

describe "homepage" do
  let(:user) {create(:user)}
  let(:post1) {create(:post)}
  before do
    RubyCAS::Filter.fake(user.onid)
    visit signin_path
    visit root_path
  end
  context "when there are no posts" do
    it "should display a message" do
      expect(page).to have_content(I18n.t('post.no_posts_message'))
    end
  end
  context "when there are posts entered" do
    before do
      post1
      visit root_path
    end
    it "should display the posts" do
      expect(page).to have_link(post1.title)
      expect(page).to have_content(post1.description)
      expect(page).to have_content(post1.meeting_time)
    end
    context "when not logged in as the owner of the post" do
      it "should not have links to edit and delete posts" do
        expect(page).to_not have_content("Edit")
        expect(page).to_not have_content("Delete")
      end
    end
    context "when logged in as the creator of the post" do
      before do
        post1.onid = user.onid
        post1.save
        visit root_path
      end
      it "should have links to edit and delete the post" do
        expect(page).to have_content("Edit")
        expect(page).to have_content("Delete")
      end
    end
  end
end
