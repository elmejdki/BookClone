class ReactionsController < ApplicationController
  def like
    reaction = Reaction.find_by(user_id: current_user.id, post_id: params[:post_id])

    unless reaction.nil?
      if reaction.like
        reaction.destroy
        redirect_to root_path
      else  
        update(reaction, true)
      end
    else
      save(true)
    end
  end

  def dislike
    reaction = Reaction.find_by(user_id: current_user.id, post_id: params[:post_id])

    unless reaction.nil?
      if reaction.dislike
        reaction.destroy
        redirect_to root_path
      else  
        update(reaction, false)
      end
    else
      save(false)
    end
  end

  def save(like)
    post = Post.find(params[:post_id])
    reaction = post.reactions.build
    reaction.user = current_user
    reaction.like = like
    reaction.dislike = !like
    
    if reaction.save
      redirect_to root_path
    else
      redirect_to root_path, alert: 'sorry your reaction was denied, try again.'
    end
  end

  def update(reaction, like)
    reaction.like = like
    reaction.dislike = !like

    reaction.save
    redirect_to root_path
  end
end
