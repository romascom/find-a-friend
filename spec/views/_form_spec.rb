require "spec_helper"

describe "posts/_form.html.erb" do
  before(:each) do
    @post = mock_model(Post)
    render :partial => "posts/form"
  end
  
  it "renders a form" do
    response.should have_selector("form")
  end
  
  it "rejects dates of incorrect format"
  
  it "rejects times of incorrect format"
  
  it "renders a calendar view"
end