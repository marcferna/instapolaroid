class Event < ActiveRecord::Base
  before_save :clean_hashtag
  after_create :create_subscription

  protected

    # Before Save callback
    # Removes the "#" pound sign from the front of the hashtag string
    #
    def clean_hashtag
      self.hashtag.slice!(0) if self.hashtag.first == "#"
    end


    #
    # Creates a new subscription with Instagram to get updates from the
    # hashtag specified
    #
    def create_subscription
      Subscription.create(hashtag)
    end
end
