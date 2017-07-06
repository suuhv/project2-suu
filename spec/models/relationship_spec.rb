require "rails_helper"

RSpec.describe Relationship, type: :model do
  context "associations" do
    it {expect belong_to :follower}
    it {expect belong_to :followed}
  end
  context "validates" do
    it {expect validate_presence_of :follower_id}
    it {expect validate_presence_of :followed_id}
  end
end
