class Post < ActiveRecord::Base

  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy
  has_many :notifications, inverse_of: :post
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :tags, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :notifications_count, presence: true

  def self.search(search, designation)
    search_condition = "%" + search + "%"
    where("#{designation} LIKE ?", "%#{search}%")
  end
end
