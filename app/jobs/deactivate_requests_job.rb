class DeactivateRequestsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    LunchRequest.where(active: true) { |lunch_request| lunch_request.deactivate }
  end
end
