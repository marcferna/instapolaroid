# setup instagram client with the CLIENT_ID and the CLIENT_SECRET
Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
end
