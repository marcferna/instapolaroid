class InstagramCallbackWorker
  @queue = :callback_queue

  def self.perform(params)
    # go through the different tags and fetch the new images.
    if params["_json"].present?
      params["_json"].each do |event|
        event = Event.find_by_hashtag(event["object_id"])
        event.fetch_recent_photos if event.present?
      end
    end
  end
end
