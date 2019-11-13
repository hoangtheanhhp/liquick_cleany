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
    @cities = JSON.parse(File.read(Rails.root.join('db/tinh_tp.json')))
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

  def search
    @keyword = params['keyword']
    @minprice = params['minprice']
    @maxprice = params['maxprice']
    @mintime = params['mintime']
    @maxtime = params['maxtime']
    @city = params['city']
    @district = params['district']

    condition = ""
    if !@keyword.empty?
      condition += "description LIKE '%#{@keyword}%' AND "
    end

    minPrice = @minprice == 'default' ? false : @minprice.to_i/1000
    maxPrice = @maxprice == 'default' ? false : @maxprice.to_i/1000
    if minPrice
      condition += "cost >= #{minPrice} AND "
    end 

    if maxPrice
      condition += "cost <= #{maxPrice} AND "
    end

    minTime = @mintime == 'default' ? false :  @mintime
    maxTime = @maxtime == 'default' ? false : @maxtime
    if minTime
      condition += "worktime_start >= #{minTime} AND "
    elsif maxTime
      condition += "worktime_start <= #{maxTime} AND "
    end

    if(!@city.empty? && @city != 'default')
      condition += "city = '#{@city}' AND "
      if(!@district.empty? && @district != 'default')
        district_s = params['district'].to_i.to_s
        condition += "district = '#{district_s}' AND "
      end
    end

    @cities = JSON.parse(File.read(Rails.root.join('db/tinh_tp.json')))
    if condition.empty?
      @partners = Partner.all
      render "homes/index"
    else 
      end_index = condition.length - 4
      @partners = Partner.where(condition[0...end_index])
      render "homes/index"
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
