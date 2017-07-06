require "rails_helper"

RSpec.describe Post, type: :model do
  context "associations" do
    it {expect belong_to :user}
    it {expect have_many :tags}
    it {expect have_many :comments}
    it {expect have_many :post_tags}
  end
  context "validates" do
    it {expect validate_presence_of :title}
    it {expect validate_presence_of :content}
  end
end
