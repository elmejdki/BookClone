class MessagesController < ApplicationController
  def create
    @message = Message.new(messages_params)
    @message.user = current_user
    @message.unread = true
    @message.save

    room = Room.find(@message.room.id)
    user = room.side_user(current_user)

    ActionCable.server.broadcast "room_channel_#{@message.room.id}",
                                  message: @message

    ActionCable.server.broadcast "message_notification_channel",
                                  notified_room: @message.room,
                                  user: current_user.id,
                                  side_user: user.id
  end

  private

  def messages_params
    params.require(:message).permit(:body, :room_id, :user_id)
  end
end
