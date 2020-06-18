class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(friendship_params)
    if friendship.save
      redirect_to users_path, notice: 'Invitation sent successful'
    else
      redirect_to users_path, Alert: 'Din\'t work =('
    end
  end

  def confirm
    user = User.find_by(params[:friend_id])
    puts "###################"
    puts user.username
    puts "###################"
    current_user.confirm_friend(user)
    redirect_to users_path, notice: 'Invitation acceted'
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
