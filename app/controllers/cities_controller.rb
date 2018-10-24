class CitiesController < ApplicationController
  before_action :require_login

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if City.find_by(id: @city.id)
      render new_city_path
    else
      @city.gather_api_city_data
      @city.save
      redirect_to cities_path
    end
  end

  def index
    @cities = City.all.sort_by{|city| city.name}
    @user = User.find(session[:user_id])
  end

  def show
    @city = City.find(params[:id])
    @city_data = @city.gather_api_city_data
    @photos = @city.gather_api_photo_data
    @user = User.find(session[:user_id])
    @trips = Trip.select{|trip| trip.city_id == @city.id}
    @reviews = @city.trips.select { |trip| trip.review if trip.review != nil}
  end

  private

  def city_params
    params.require(:city).permit(:name, :latitude, :longtitude, :country, :description)
  end

end
