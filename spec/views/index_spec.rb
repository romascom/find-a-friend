require "spec_helper"

describe "posts/index.html.erb" do
  before(:each) do
    @post = mock_model(Post)
  end
  
  it "renders a post" do
    render
    expect(rendered).to render_template("_post")
  end
end