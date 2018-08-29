class LunchRequestsController < ApplicationController
  def new
    @lunch_request = current_user.other_active_request
    if @lunch_request
      authorize @lunch_request
      redirect_to lunch_request_path(@lunch_request) and return
    end

    @lunch_request = LunchRequest.new
    @coordinates = Geocoder.search(request.remote_ip)
    authorize @lunch_request
  end

  def create
    @lunch_request = LunchRequest.new(lunch_request_params)
    authorize @lunch_request
    @lunch_request.user = current_user
    other_active_request = current_user.other_active_request
    redirect_to lunch_request_path(other_active_request) and return if other_active_request
    if @lunch_request.save
      # notify_incoming_requests_channel
      # MakeMatchesJob.perform_now
      # MakeMatchesJob.perform_later
      MakeMatchesJob.set(wait: 5.seconds).perform_later
      # @lunch_date = @lunch_request.lunch_date if @lunch_request.lunch_date
      redirect_to lunch_request_path(@lunch_request)
    else
      raise
      render :new
    end
  end

  def show
    @lunch_request = LunchRequest.find(params[:id])
    @location = {lat: @lunch_request.latitude, lng: @lunch_request.longitude}
    authorize @lunch_request
  end

  def destroy
    lunch_request = LunchRequest.find(params[:id])
    authorize lunch_request
    lunch_request.destroy
    redirect_to root_path
  end

  private


  def lunch_request_params
    params.require(:lunch_request).permit(:latitude, :longitude)
  end
end
