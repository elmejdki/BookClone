class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_id: params[:post_id], text: params[:comment][:text])
    # Fix: add action cable to handle adding comments
    if @comment.save
      redirect_to request.referrer, notice: "Comment posted"
    else
      redirect_to request.referrer, alert: "Your comment was not posted"
    end
  end
  
  def destroy
    # Fix: add action cable to handle adding comments
    if Comment.find(params[:id]).destroy
      redirect_to request.referrer, notice: "Comment deleted"
    else
      redirect_to request.referrer, alert: "Your comment was not posted"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
