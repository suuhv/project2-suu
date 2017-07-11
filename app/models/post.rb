class Post < ApplicationRecord
  belongs_to :user

  scope :order_by_desc, ->{order created_at: :desc}
  scope :search, ->(search){where "title LIKE ? OR content LIKE ?",
    "%#{search}%", "%#{search}%"}
  mount_uploader :picture, PictureUploader

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  def all_tags
    tags.map(&:name).join(", ")
  end

  def all_tags=names
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
