class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @user = User.find(session[:user_id])
  end

  def create
    @review = Review.create(review_params)
    @city = @review.trip.city_id
    redirect_to city_path(@city)
  end

  def show
    @review = Review.find(params[:id])
    @reviews = @user.trips.all
  end

  private
    def review_params
      params.require(:review).permit(:trip_id, :description, :rating)
    end
 end
