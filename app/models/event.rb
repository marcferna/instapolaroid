class Event < ActiveRecord::Base

  # Callbacks
  before_save :clean_hashtag
  after_create :create_subscriptions

  # Relationships
  has_many :photos

  def fetch_recent_photos
    photos = Instagram.tag_recent_media(self.hashtag)
    photos.each do |photo|
      next if Photo.find_by_instagram_photo_id(photo.id)
      Photo.create_with_parameters(photo, self.id)
    end
  end

private

  #
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
  def create_subscriptions
    Subscription.create_subscriptions(self.id, self.hashtag)
  end
end
