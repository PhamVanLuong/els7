class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include LessonsHelper
  private

  def access_admin
    unless current_user.admin?
      flash[:danger] = t("user.access_admin")
      redirect_to root_url
    end
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = t("flash.danger")
      redirect_to login_url
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
