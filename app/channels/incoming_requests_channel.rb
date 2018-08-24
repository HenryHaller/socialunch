class IncomingRequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "incoming_requests"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
