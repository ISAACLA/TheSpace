class UsersController < ApplicationController
    before_action :require_login, only: [:main, :show, :profile, :edit, :update, :userimages]
    before_action :require_correct_user_users, only: [:edit, :update]
    before_action :require_only_profile, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]=['You have successfully registerred your account, please now login']
      # redirect_to '/login'
      redirect_to "/users/#{@user.id}/main"
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to :back
    end
  end

  def main
    @user = User.find(session[:user_id])
    @my_state_events = Event.where(state:"#{@user.state}").order(created_at: :desc)
    @other_events = Event.where.not(state:"#{@user.state}").order(created_at: :desc)

    @images = Image.order("RANDOM()").limit(30)

  end

  def show
    @currentuser = User.find(session[:user_id])
    @user = User.find(params[:id])
    @events = Event.where(user_id:@user.id)
    @attending = Attendee.where(user_id:@user.id)
  end

  def profile
    @user = User.find(session[:user_id])
    @images = Image.where(user_id:current_user.id).order(created_at: :desc)

    @events = Event.where(user_id: @user.id)
    @attending = Attendee.where(user_id:@user.id)
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_params)
    if @user.save
      flash[:notice]=["You have updated your profile"]
      redirect_to "/users/#{@user.id}/profile"
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to :back
    end
  end

  def userimages
    @currentuser = User.find(current_user.id)
    @user = User.find(params[:id])
    @images = Image.where(user_id:@user.id)
  end


  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:zipcode, :state, :password,:password_confirmation)
  end
end
