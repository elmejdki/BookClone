class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      redirect_to root_path, notice: 'review created successfully'
    else
      redirect_to root_path, alert: 'review was not created, for some raison'
    end
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

end
