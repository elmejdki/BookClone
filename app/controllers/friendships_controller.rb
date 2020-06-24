class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    friendship = Friendship.new(friendship_params)
    if friendship.save
      redirect_to request.referrer, notice: 'Invitation sent successful'
    else
      redirect_to request.referrer, Alert: 'Din\'t work =('
    end
  end

  def confirm
    friend = User.find(params[:friend_id])
    current_user.confirm_friend(friend)
    redirect_to request.referrer, notice: 'Invitation accepted'
  end

  def destroy
    friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    friendship.destroy

    inverse_friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    friendship.destroy unless inverse_friendship.nil?

    redirect_to request.referrer, notice: 'Friend Request was declined.'
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
