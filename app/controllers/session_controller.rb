class SessionController < ApplicationController
  
  def login
  end

  def register
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to "/users/#{session[:user_id]}/main"
    else
      flash[:errors]=["You input does NOT match our record, please double check."]
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
