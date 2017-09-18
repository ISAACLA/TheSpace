class EventsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @my_state_events = Event.where(state:"#{@user.state}").order(created_at: :desc)
    @other_events = Event.where.not(state:"#{@user.state}").order(created_at: :desc)
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice]=["You have successfully created an Event."]
      redirect_to '/events'
    else
      flash[:errors]=@event.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.save
      flash[:notice]=["You have successfully updated the event."]
      redirect_to '/events'
    else
      flash[:errors] = event.errors.full_messages
      redirect_to :back
    end 
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to '/events'
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :time, :address, :city, :state, :description, :zipcode).merge(user:current_user)
  end

end
