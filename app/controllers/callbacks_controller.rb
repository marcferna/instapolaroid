class CallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  # GET /callback
  def callback_verification
    render text: params["hub.challenge"]
  end

  # POST /callback
  # Parameters: {"_json"=>[{"changed_aspect"=>"media", "object"=>"tag", "object_id"=>"marctest", "time"=>1403393505, "subscription_id"=>6459630, "data"=>{}}]
  def callback
    # go through the different tags and fetch the new images.
    if params["_json"].present?
      params["_json"].each do |event|
        event = Event.find_by_hashtag(event["object_id"])
        event.fetch_recent_photos if event.present?
      end
    end
    head :ok
  end
end
