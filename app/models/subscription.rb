class Subscription

  def self.create(hashtag)
    callback_url = ENV['CALLBACK_URL']
    subscription = Instagram.create_subscription(
      object:       'tag',
      callback_url: callback_url,
      aspect:       'media',
      object_id:    hashtag,
    )
    return subscription.id
  end
end
