class Comment < ActiveRecord::Base

  belongs_to :user, inverse_of: :comments, dependent: :destroy
  belongs_to :post, inverse_of: :comments, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true
end
