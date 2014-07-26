class Tag < ActiveRecord::Base

  has_and_belongs_to_many :posts

  validates :name, presence: true
  validates :posts_count, presence: true
end
