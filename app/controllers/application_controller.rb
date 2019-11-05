class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include PartnerSessionsHelper

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "Please login first!"
    redirect_to signin_url
  end

  def logged_in_partner
    return if partner_logged_in?
    store_location
    flash[:danger] = "Please login first!"
    redirect_to partner_login_url
  end
end
