require "rails_helper"

RSpec.describe "static_pages/help.html.erb", type: :view do
  it "displays" do
    render
    expect(rendered).to have_tag("h1", text: "Help")
  end
end
