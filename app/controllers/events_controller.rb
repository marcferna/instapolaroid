class EventsController < ApplicationController
  def index
    @events = Event.order(:title)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create!(event_params)
  end

  def show
    @event = Event.find_by(id: params["id"])
    if @event.present?
      @photos = @event.photos
                      .order("created_at DESC")
                      .limit(100)
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :hashtag)
    end

end
