class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    authorize @message
    @lunch_date = LunchDate.find(params[:lunch_date_id])
    @message.lunch_date = @lunch_date
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to lunch_date_path(@lunch_date) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "lunch_dates/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
