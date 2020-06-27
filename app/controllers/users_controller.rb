class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @friends = current_user.friends
    @non_friends = User.all.filter{ |user| 
      !@friends.include?(user) &&
      current_user != user &&
      !current_user.pending_friends.include?(user) &&
      !current_user.friend_requests.include?(user)
    }
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end

  def update_avatar
    @user = current_user

    if @user.update(avatar: params[:user][:avatar])
      redirect_to user_path(current_user), notice: 'avatar was updated successfully.'
    else
      redirect_to user_path(current_user), alert: 'avatar wasn\'t updated for some reason.'
    end
  end
  
  def update_cover
    @user = current_user

    if @user.update(cover_picture: params[:user][:cover_picture])
      redirect_to user_path(current_user), notice: 'cover image was updated successfully.'
    else
      redirect_to user_path(current_user), alert: 'cover iamge wasn\'t updated for some reason.'
    end
  end

  def new_friends
    @unread_messages = check_if_there_is_new_messages(current_user)
  end
end
