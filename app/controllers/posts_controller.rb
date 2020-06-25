class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.friends_and_own_posts
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to request.referrer, notice: 'post created successfully'
    else
      redirect_to request.referrer, alert: 'post was not created, for some raison'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if Post.find(params[:id]).update(post_params)
      redirect_to request.referrer, notice: 'post updated'
    else
      redirect_to request.referrer, alert: 'some dumb thing happened'
    end
  end
  
  def destroy
    if Post.find(params[:id]).destroy
      redirect_to request.referrer, notice: 'post deleted'
    else
      redirect_to request.referrer, alert: 'some dumb thing happened'
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :image)
  end
end
