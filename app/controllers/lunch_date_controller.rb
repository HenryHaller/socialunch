class LunchDateController < ApplicationController
  def show
    @lunch_date = LunchDate.find(params[:id])
  end
end
