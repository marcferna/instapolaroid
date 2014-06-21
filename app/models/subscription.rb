class Subscription

  def self.create(hashtag)
    Instagram.create_subscription(
      object:       'tag',
      callback_url: 'http://instapolaroid.herokuapp.com/callback',
      aspect:        'media',
      object_id:     hashtag,
    )
  end
end
