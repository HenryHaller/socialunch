class MakeMatchesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    requests = LunchRequest.where(active: true)
    smoking_requests = requests.select { |request| request.smoking }
    non_smoking_requests = request.reject { | request| request.smoking }
    requests do |lunch_request|
    end
    # Do something later
  end
end
