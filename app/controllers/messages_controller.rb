class MessagesController < ApplicationController
  def create
    @message = Message.new(messages_params)
    @message.user = current_user
    @message.save

    redirect_to request.referrer
  end

  private

  def messages_params
    params.require(:message).permit(:body, :room_id, :user_id)
  end
end
