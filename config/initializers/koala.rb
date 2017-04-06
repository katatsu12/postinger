Koala.configure do |config|
  # config.access_token = ''
  config.app_id = Rails.application.secrets.facebook_api_token
  config.app_secret = Rails.application.secrets.facebook_api_secret
end
