class Subscription::Instagram

  def self.create(event_id, hashtag)
    Resque.enqueue(InstagramWorker, event_id, hashtag)
  end

end
