class Post < ApplicationRecord
  belongs_to :user

  scope :order_by_desc, ->{order created_at: :desc}
  mount_uploader :picture, PictureUploader

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
