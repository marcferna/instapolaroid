class Event < ActiveRecord::Base
  after_create :create_subscription

  protected

    def create_subscription
      Subscription.create(
        hashtag: self.hashtag
      )
    end
end
