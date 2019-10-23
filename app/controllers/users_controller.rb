class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
 	def index
  end

  def new
    redirect_to '/' if logged_in?
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Register success"
      redirect_to signin_path
    else
      flash[:danger] = "Register failed"
      render :new
    end
  end

  def show
  	@user = User.find_by id: params[:id]
  	return @user if @user
  	flash[:danger] = "User not found!"
  	redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :password, :password_confirmation
  end
end
