class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lunch_date_#{params[:lunch_date_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
