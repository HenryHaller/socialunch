class LunchRequestController < ApplicationController
  def new
    @lunch_request = LunchRequest.new
  end

  def create
  end

  def show
    LunchRequest.find(params[:id])
  end

  def destroy
    lunch_request = LunchRequest.find(params[:id])
    lunch_request.destroy
    redirect_to root_path
  end
end
