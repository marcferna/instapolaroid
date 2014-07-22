class EventsController < ApplicationController
  def index
    @events = Event.includes(:photos).all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create!(event_params)
  end

  def show
    @event = Event.find_by(id: params["id"])
    @photos = @event.photos.limit(100) if @event.present?
  end

  private

    def event_params
      params.require(:event).permit(:title, :hashtag)
    end

end
