class Post < ActiveRecord::Base

  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy
  has_many :notifications, inverse_of: :post, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
