Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
  {
    scope: 'profile',
    image_aspect_ratio: 'square',
    image_size: 100,
    access_type: 'online'
  }

end
