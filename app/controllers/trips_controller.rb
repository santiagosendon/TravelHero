class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @user = User.find(params[:user_id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @user = User.find(params[:user_id])
    params["status"].each do |city_id, status|
       @trip = Trip.find_by(user_id: params[:user_id], city_id: city_id.to_i)
      if @trip
        @trip.status = status
        @trip.save
      else
         @trip = Trip.create(user_id: params[:user_id], city_id: city_id.to_i, status: status)
      end
    end
    redirect_to user_trips_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @cities = City.all.sort_by{|city| city.name}
    @trips = @user.trips
  end

  def update
    @user = User.find(params[:user_id])
  end



end
