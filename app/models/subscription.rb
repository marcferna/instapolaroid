class Subscription

  def self.create(hashtag)
    Instagram.create_subscription(
      object:       'tag',
      callback_url: 'https://95xaxankq6b8.runscope.net/',
      object_id:     hashtag
    )
  end
end