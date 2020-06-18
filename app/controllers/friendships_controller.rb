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
    friend = User.find(params[:friend_id])
    current_user.confirm_friend(friend)
    redirect_to users_path, notice: 'Invitation accepted'
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
