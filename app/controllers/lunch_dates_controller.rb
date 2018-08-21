class LunchDatesController < ApplicationController
  def show
    @lunch_date = LunchDate.find(params[:id])
    authorize @lunch_date
  end
end
