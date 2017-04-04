VkontakteApi.configure do |config|
  config.app_id       = Rails.application.secrets.vk_api_id
  config.app_secret   = Rails.application.secrets.vk_api_key
  config.redirect_uri = 'http://postinger.pp.ua/users/auth/vkontakte/callback'
end
