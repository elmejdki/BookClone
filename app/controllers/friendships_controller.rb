class FriendshipsController < ApplicationController
  before_action :authenticate_user!

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
    redirect_to friend_requests_path, notice: 'Invitation accepted'
  end

  def destroy
    friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    friendship.destroy
    redirect_to friend_requests_path, notice: 'Friend Request was declined.'
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
