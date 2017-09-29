class ImageController < ApplicationController
  def show
    if current_user
      @user = User.find(current_user.id)
    end
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @image = Image.create(image_params)
    if @image.save
      flash[:notice]=['You have successfully uploaded your image']
      redirect_to "/users/#{@user.id}/profile"
    else
      flash[:errors]=image.errors.full_messages
      redirect_to :back
    end
  end

  def imageshow
    @user = User.find(current_user.id)
    @image = Image.find(params[:id])
    @comments = Image.find(@image.id).comments
  end

  private
  def image_params
    params.require(:image).permit(:title, :description, :image).merge(user:current_user)
  end
end
