class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'post created successfully'
    else
      redirect_to root_path, alert: 'post was not created, for some raison'
    end
  end

  def new
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
