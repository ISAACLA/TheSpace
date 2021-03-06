class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_login
    redirect_to '/login' unless session[:user_id]
  end

  def require_correct_user
    event = Event.find(params[:id])
    redirect_to "/users/#{current_user.id}/profile" if current_user.id != event.user.id
  end

  def require_correct_user_users
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}/profile" if current_user.id != user.id
  end

  def require_only_profile
    user = User.find(params[:id])
    redirect_to "/users/#{user.id}/profile" if current_user.id == user.id
  end
end
