class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id]=@user.id
      flash[:notice]=['You have successfully registerred your account, please now login']
      redirect_to '/login'
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to :back
    end
  end

  def main
    @user = User.find(current_user.id)
    @my_state_events = Event.where(state:"#{@user.state}").order(created_at: :desc)
    @other_events = Event.where.not(state:"#{@user.state}").order(created_at: :desc)
  end

  def show
    @user = User.find(current_user.id)
    @events = Event.where(user_id:@user.id)
    @attending = Attendee.where(user_id:@user.id)
  end

  def profile
    @user = User.find(current_user)
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    if @user.save
      flash[:notice]=["You have updated your profile"]
      redirect_to "/users/#{@user.id}/profile"
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to :back
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:zipcode, :state, :password,:password_confirmation)
  end
end
