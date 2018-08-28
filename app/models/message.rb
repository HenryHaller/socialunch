class Message < ApplicationRecord
  belongs_to :lunch_date
  belongs_to :user
  validates :content, presence: true, allow_blank: false
  after_create :broadcast_message


  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    channel = "lunch_date_#{lunch_date.id}"
    puts ">>>>>>>>>>>>>>>>>>"
    puts channel
    puts "<<<<<<<<<<<<<<<<<<"
    ActionCable.server.broadcast(channel, {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
    })
  end

end
