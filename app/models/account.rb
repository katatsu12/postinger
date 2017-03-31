class Account < ApplicationRecord
  belongs_to :user
 
  def self.find_for_oauth(auth)
    if ['twitter'].include?(auth.provider)
      find_or_create_by(
        uid: auth.uid, 
        provider: auth.provider,
        email: auth.info.email,
        token: auth.credentials.token, 
        secret: auth.credentials.secret
      )
    elsif ['facebook'].include?(auth.provider)
     find_or_create_by(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        token: auth.credentials.token,
        secret: auth.credentials.expires_at
      )
    end
  end
end
