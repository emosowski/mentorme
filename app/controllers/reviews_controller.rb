class ReviewsController < ApplicationController

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    @feedbacks = @user.feedback
  end


  def create
    @appointment = Appointment.find(params[:appointment_id])
    @review = @appointment.reviews.build(review_params)
    @review.author_id = current_user.id
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
