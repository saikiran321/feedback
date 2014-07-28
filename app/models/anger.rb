class Anger < ActiveRecord::Base

  belongs_to :user, inverse_of: :angers
  belongs_to :post, inverse_of: :angers

  validates :level, presence: true
  validates :user_id, presence: true
end
