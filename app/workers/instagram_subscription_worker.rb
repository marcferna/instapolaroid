class InstagramSubscriptionWorker
  @queue = :subscription_queue

  def self.perform(event_id, hashtag)
    event = Event.find(event_id)

    if Rails.env.production?
      subscription = Instagram.create_subscription(
        object:       'tag',
        callback_url: ENV['INSTAGRAM_CALLBACK_URL'],
        aspect:       'media',
        object_id:    hashtag,
      )
      event.update_attributes(instagram_subscription_id: subscription.id)
    end
  end
end
