class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t("flash.welcome")
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t("edit.update_profile")
      redirect_to @user
    else
      flash.now[:danger] = t("flash.update_fail")
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:success] = t("danger.delete_success")
    else
      flash[:danger] = t("danger.delete.fails")
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
      :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t("flash.danger")
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
