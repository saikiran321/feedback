class Notification < ActiveRecord::Base

  belongs_to :user, inverse_of: :notifications
  belongs_to :post, inverse_of: :notifications

end
