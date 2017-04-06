VkontakteApi.configure do |config|
  config.app_id       = Rails.application.secrets.vk_api_key
  config.app_secret   = Rails.application.secrets.vk_api_secret
  config.redirect_uri = 'http://postinger.pp.ua/accounts/vk_callback'
end
