class MessagesController < ApplicationController
  def create
    @message = Message.new(messages_params)
    @message.user = current_user
    @message.save

    # redirect_to request.referrer

    ActionCable.server.broadcast "room_channel_#{@message.room.id}",
                                  message: @message,
                                  user_name: @message.user.fullname

  end

  private

  def messages_params
    params.require(:message).permit(:body, :room_id, :user_id)
  end
end
