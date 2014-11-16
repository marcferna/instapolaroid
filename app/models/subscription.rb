class Subscription

  # Constants
  PROVIDERS = [
    :instagram
  ].freeze

  def self.create_subscriptions(event_id, hashtag)
    PROVIDERS.each do |provider|
      provider_class = "Subscription::#{provider.capitalize.to_s}".constantize
      provider_class.create(event_id, hashtag)
    end
  end
end
