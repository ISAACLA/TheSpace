class LikeController < ApplicationController

  def create
    @user = User.find(current_user.id)
    # @image = Image.find(params[:id])
    Like.create like_parmas
    redirect_to "/images/#{params[:id]}/show"
  end

  private
  def like_parmas
    params.require(:like).permit(:image_id).merge(user:current_user)
  end

end
