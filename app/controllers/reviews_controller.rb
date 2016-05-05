class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    @feedback = @user.feedback
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to '/reviews'
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:body, :rating)
    end
end
