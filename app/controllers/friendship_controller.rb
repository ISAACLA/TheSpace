class FriendshipController < ApplicationController
  before_action :require_login
  
  def create
    @user = User.find(current_user.id)
    # @image = Image.find(params[:id])
    Friendship.create friendship_params
    redirect_to "/users/#{@user.id}/profile"
  end

  def destroy
    @user = User.find(current_user.id)
    @friendship = Friendship.where(user_id:current_user.id, friend_id:params[:id]).first
    @friendship.destroy if current_user.id === @friendship.user_id
    # @friendship.destroy

    redirect_to "/users/#{@user.id}/profile"
  end

  private
  def friendship_params
    params.require(:friendship).permit(:friend_id).merge(user:current_user)
  end
end
