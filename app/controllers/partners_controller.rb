class PartnersController < ApplicationController
  include PartnerSessionsHelper
  before_action :logged_in_partner, only: [:show, :index, :edit, :update]
  before_action :load_user, only: [:show, :edit, :update, :correct_user]
  before_action :correct_user, only: [:show, :edit, :update]
  def index
    @users = Partner.all  
  end

  def new
    redirect_to '/' if partner_logged_in?
    @user = Partner.new
  end

  def create
    @user = Partner.new user_params
    if @user.save
      @user.send_activation_email
      flash[:success] = "Check mail to active your account!"
      redirect_to partner_login_path
    else
      flash[:danger] = "Register failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Update Successfully!"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def correct_user
    redirect_to root_path unless @user&.current_partner? current_partner
  end

  def user_params
    params.require(:partner).permit Partner::PARTNER_ATTRIBUTE
  end

  def load_user
    @user = Partner.find_by id: params[:id]

    return @user if @user
    flash[:danger] = "Partner not found!"
    redirect_to root_path
  end
end
