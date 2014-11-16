class Subscription::Instagram

  def self.create(event_id, hashtag)
    Resque.enqueue(InstagramSubscriptionWorker, event_id, hashtag)
  end

end
