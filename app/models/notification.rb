class Notification < ActiveRecord::Base

  belongs_to :user, inverse_of: :notifications
  belongs_to :post, inverse_of: :notifications

  validates :notif_user, presence: true 
  validates :action, presence: true
end
