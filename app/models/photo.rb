class Photo < ActiveRecord::Base

  serialize :parameters, Hash

  def self.create_with_parameters(photo, event_id)
    Photo.create!(
      event_id:           event_id,
      instagram_photo_id: photo.id,
      url:                photo.images.standard_resolution.url,
      username:           photo.user.username,
      parameters:         photo
    )
  end
end
