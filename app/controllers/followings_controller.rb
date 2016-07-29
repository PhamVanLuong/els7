class FollowingsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @users = @user.following.paginate page: params[:page],
      per_page: Settings.users_per_page
  end
end
