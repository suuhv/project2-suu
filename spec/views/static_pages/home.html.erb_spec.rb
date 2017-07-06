require "rails_helper"

RSpec.describe "static_pages/home.html.erb", type: :view do
  it "displays" do
    render
    expect(rendered).to have_tag("h1", text: "Welcome to the MLOG")
    expect(rendered).to have_tag("a", text: "Sign up now!")
  end
end
