class NotificationsController < ApplicationController

  def index
    @notifs = Notification.where("seen='false' AND user_id=?", current_user.id)
    @notifs.each do |notif|
      notif.seen = true
      notif.save
    end
  end

  def show
    @notif = Notification.find(params[:id])
  end
end
