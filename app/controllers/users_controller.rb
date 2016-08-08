class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  load_and_authorize_resource
#   before_action :correct_user, only: [:edit, :update]
#   before_action :load_user, only: [:show, :edit, :update]

  def index
    @user = User.find_by(id: params[:id])
    @users = User.paginate page: params[:page],
      per_page: Settings.users_per_page
  end

#   def create
#     @user = User.new(user_params)
#     if @user.save
#       flash[:success] = t("flash.welcome")
#       log_in @user
#       redirect_to @user
#     else
#       render :new
#     end
#   end

#   def new
#     @user = User.new
#   end

#   def edit
#   end

#   def update
#     if @user.update_attributes(user_params)
#       flash[:success] = t("edit.update_profile")
#       redirect_to @user
#     else
#       flash.now[:danger] = t("flash.update_fail")
#       render :edit
#     end
#   end

  def show
    @user = User.find_by(id: params[:id])
    @activities = @user.activities.paginate(page: params[:page],
      per_page: Settings.users_per_page)
  end

  # def index
  #   @user = User.find_by(id: params[:id])
  #   @users = User.paginate page: params[:page],
  #     per_page: Settings.users_per_page
  # end
 
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:success] = t("user.delete")
    else
      flash[:danger] = t("user.delete_fail")
    end
    redirect_to admin_users_path
  end

#   private

#   def user_params
#     params.require(:user).permit(:name, :email,
#       :password, :password_confirmation)
#   end

#   def correct_user
#     @user = User.find_by(id: params[:id])
#     redirect_to(root_url) unless current_user?(@user)
#   end

#   def load_user
#     @user = User.find_by(id: params[:id])
#   end
end
