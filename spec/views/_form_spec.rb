require "spec_helper"

describe "posts/_form.html.erb" do
  before(:each) do
    @post = mock_model(Post)
    render :partial => "posts/form"
  end
  
  it "renders a form" do
    response.should have_selector("form")
  end
end