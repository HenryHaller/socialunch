class LunchDatesController < ApplicationController
  def show
    @lunch_date = LunchDate.includes(messages: :user).find(params[:id])
    authorize @lunch_date
  end
end
