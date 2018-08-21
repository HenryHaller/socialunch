class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @lunch_request = LunchRequest.new
  end
end
