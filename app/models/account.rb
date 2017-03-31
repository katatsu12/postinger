class Account < ApplicationRecord
  belongs_to :user
 
  def self.find_for_oauth(auth)
    find_or_create_by(
      uid: auth.uid, 
      provider: auth.provider, 
      token_twitter: auth.credentials.token, 
      secret_twitter: auth.credentials.secret,
      email: auth.info.email
    )
  end
end
