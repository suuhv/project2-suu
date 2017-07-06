require "rails_helper"

RSpec.describe Comment, type: :model do
  context "associations" do
    it {expect belong_to :user}
    it {expect belong_to :post}
  end
  context "validates" do
    it {expect validate_presence_of :content}
  end
end
