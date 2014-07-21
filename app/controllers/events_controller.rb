class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create!(event_params)
  end

  def edit
    @event = Event.find(params["event_id"])
  end

  private

    def event_params
      params.require(:event).permit(:title, :hashtag)
    end

end
