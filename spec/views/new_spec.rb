require "spec_helper"

describe "posts/new.html.erb" do
  before(:each) do
    @post = mock_model(Post)
  end
  
  it "renders _form partial" do
    render
    expect(rendered).to render_template("_form")
  end
end