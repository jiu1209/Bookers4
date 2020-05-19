class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def index
  	@users =User.all
    @user = current_user
  end

  def follows
  	@user = User.find(params[:user_id])
  	@users = @user.following_user
  	render :index
  end

  def followers
  	@user = User.find(params[:user_id])
  	@users = @user.follower_user
  	render :index
 end
end
