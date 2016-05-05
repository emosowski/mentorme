class ReviewsController < ApplicationController

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    @feedback = @user.feedback
  end


  def create
    @review = Review.new(review_params)
    # @user = current_user.id
    if @review.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:body, :rating)
    end
end
