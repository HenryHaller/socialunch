class LunchDatesController < ApplicationController
  def index
    puts current_user
    @lunch_dates = []
    LunchDate.all.each do |date|
      puts date
      if date.request1.user == current_user || date.request2.user == current_user
        @lunch_dates << date
      end
    end
  end

  def show
    @lunch_date = LunchDate.includes(messages: :user).find(params[:id])
    authorize @lunch_date
  end
end
