require "rails_helper"

RSpec.describe Tag, type: :model do
  context "associations" do
    it {expect have_many :posts}
    it {expect have_many :post_tags}
  end
end
