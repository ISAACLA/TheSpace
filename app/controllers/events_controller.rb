class EventsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @my_state_events = Event.where(state:"#{@user.state}").order(created_at: :desc)
    @other_events = Event.where.not(state:"#{@user.state}").order(created_at: :desc)

    @state_events = Event.where(state:params[:state]).order(created_at: :desc)
    @state = params[:state]

  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @event = Event.new(event_params)
    if @event.save
      flash[:notice]=["You have successfully created an Event."]
      # redirect_to "/users/#{@user.id}/profile"
      redirect_to "/events/#{@event.id}"
    else
      flash[:errors]=@event.errors.full_messages
      redirect_to :back
    end
  end


  def show
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
    @comments = Event.find(@event.id).comments
  end

  def edit
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    event = Event.find(params[:id])
    event.update(event_params)
    if event.save
      flash[:notice]=["You have successfully updated the event."]
      redirect_to "/users/#{@user.id}/profile"
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
