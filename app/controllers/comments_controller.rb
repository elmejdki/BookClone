class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_id: params[:post_id], text: params[:comment][:text])
    if @comment.save
      redirect_to root_path, notice: "Comment posted"
    else
      redirect_to root_path, alert: "Your comment was not posted"
    end
  end
  
  def destroy
    if Comment.find(params[:id]).destroy
      redirect_to root_path, notice: "Comment deleted"
    else
      redirect_to root_path, alert: "Your comment was not posted"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
