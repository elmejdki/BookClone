class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_if_there_is_new_messages, only: [:index, :show]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar,:cover_picture, :fullname, :bio, :city, :gender, :profession])
  end

  def check_if_there_is_new_messages
    @dead_rooms = 0

    if current_user
      rooms = current_user.rooms.uniq
      rooms.each do |room|
        message = room.messages.last
        if message.user_id != current_user.id && message.unread
          @dead_rooms += 1
        end
      end
    end 
  end
end
