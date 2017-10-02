class AttendeesController < ApplicationController
  before_action :require_login

  def create
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    attendee = Attendee.new(attendee_params)
    if attendee.save
      flash[:notice]=["Have fun at the event."]
      redirect_to "/events/#{@event.id}"
    else
      flash[:errors]=attendee.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    attendee = Attendee.where(user_id:current_user.id, event_id: params[:id]).first
    attendee.destroy if current_user.id == attendee.user_id
    redirect_to "/events/#{@event.id}"
  end

  private
  def attendee_params
    params.require(:attendee).permit(:event_id).merge(user:current_user)
  end
end
