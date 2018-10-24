class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips.all
  end


  private

  def user_params
    params.require(:user).permit(:username, :first_name,:last_name, :email, :bio, :admin, :password, :password_confirmation)
  end

end
