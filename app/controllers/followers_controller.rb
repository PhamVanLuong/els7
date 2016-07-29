class FollowersController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @users = @user.followers.paginate page: params[:page],
      per_page: Settings.users_per_page
  end
end
