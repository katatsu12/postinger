class Account < ApplicationRecord
  belongs_to :user
 
  def self.find_for_oauth(auth)
    if ['twitter'].include?(auth.provider)
      find_or_create_by(
        uid: auth.uid, 
        provider: auth.provider,
        email: auth.info.email,
        token_tw: auth.credentials.token, 
        secret_tw: auth.credentials.secret
      )
    elsif ['facebook'].include?(auth.provider)
      find_or_create_by(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        token_fb: auth.credentials.token
      )
    elsif ['google_oauth2'].include?(auth.provider)
      find_or_create_by(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        token_g: auth.credentials.token
      )
    elsif ['vkontakte'].include?(auth.provider)
      find_or_create_by(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        token_vk: auth.credentials.token
      )
    end
  end
end
