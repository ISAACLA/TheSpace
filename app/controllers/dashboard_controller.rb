class DashboardController < ApplicationController
  def root
  end

  def apod
    if current_user
      @user = User.find(current_user.id)
    end
  end
end
