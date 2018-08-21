class LunchRequestsController < ApplicationController
  def new
    @lunch_request = LunchRequest.new
  end

  def create
    @lunch_request = LunchRequest(lunch_request_params)
    @lunch_request.user = current_user
    if @lunch_request.save
      redirect_to LunchRequest_show_path(@lunch_request)
    else
      render :new
    end
  end

  def show
    LunchRequest.find(params[:id])
  end

  def destroy
    lunch_request = LunchRequest.find(params[:id])
    lunch_request.destroy
    redirect_to root_path
  end

  private
  def lunch_request_params
    params.require(:lunch_request).permit(:datetime, :suggested_duration, :lunch_type)
  end
end
