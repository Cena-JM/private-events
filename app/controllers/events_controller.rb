# frozen_string_literal: true

# EventsController
class EventsController < ApplicationController
  before_action :logged_in, only: %i[new create]

  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to events_path
    else
      flash.now[:danger] = 'Event couldn\'t be created'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :description)
  end
end
