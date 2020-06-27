class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_id: params[:post_id], text: params[:comment][:text])

    @comment.save
    ActionCable.server.broadcast "comments_channel",
                                  comment: @comment,
                                  user: current_user,
                                  post: @comment.post
  end

  def destroy
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
