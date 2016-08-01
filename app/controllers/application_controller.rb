class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private

  def access_admin
    unless current_user.admin?
      flash[:danger] = t("controller.application.access_admin")
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t("controller.application.danger")
      redirect_to login_url
    end
  end
end
