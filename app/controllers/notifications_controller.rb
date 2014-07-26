class NotificationsController < ApplicationController

  def index
    @notifs = Notification.where("seen='false' AND user_id=?", current_user.id)
    @notifs.each do |notif|
      notif.update_attribute(:seen, true)
    end
  end

  def show
    @notif = Notification.find(params[:id])
  end
end
