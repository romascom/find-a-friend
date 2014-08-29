require 'spec_helper'

describe 'Mailer' do
  let(:post_with_recipient) {create(:post, :with_recipient)}
  before do
    RubyCAS::Filter.fake("testonid")
    visit signin_path
    visit root_path
  end
  context "When creating a new post" do
    before do
      visit new_post_path
    end

    context "and the post has email recipients" do
      before do
        fill_in "Title", :with => "Test Title"
        fill_in "Description", :with => "Test Description"
        fill_in "Location", :with => "Test Location"
        fill_in "Meeting time", :with => Time.now
        fill_in "End time", :with => Time.now
        fill_in "Recipients", :with => "Email@test.com"
        click_button "Create Post"
      end
      it "should send the email" do
        expect(ActionMailer::Base.deliveries.length).to eq 1
        expect(ActionMailer::Base.deliveries.first.subject).to have_content("Test Title")
      end
      context "then when editing the post" do
        before do
          click_link "Edit"
        end

        context "and the post has email recipients" do
          context "after changing info in the post" do
            before do
              fill_in "Title", :with => "New Title"
              click_button "Update Post"
            end
            it "should send a new email with the new information" do
              expect(ActionMailer::Base.deliveries.length).to eq 2
              binding.pry
              expect(ActionMailer::Base.deliveries.last.subject).to have_content("New Title")
            end
          end
        end
      end
    end
  end
end