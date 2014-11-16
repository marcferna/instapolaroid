Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == ENV['BASIC_AUTH_USER']
  password == ENV['BASIC_AUTH_PASSWORD']
end
