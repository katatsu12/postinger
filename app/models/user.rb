class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :accounts 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         :omniauth_providers => [:facebook, :twitter, :vkontakte]

  def self.from_twitter(auth)
    user = Account.where(uid: auth.uid, provider: auth.provider).first
      unless user.nil?
        user.user
      else
        registered_user = User.where(username: auth.info.nickname).first
      unless registered_user.nil?
        Account.create!( 
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          token_twitter: auth.credentials.token,
          secret_twitter: auth.credentials.secret,
          user_id: registered_user.id)
        registered_user
      else
        user = User.create!(
          email: auth.info.email,
          password: Devise.friendly_token[0,20],
          username: auth.info.nickname)
        account = Account.create!(
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          token_twitter: auth.credentials.token,
          secret_twitter: auth.credentials.secret,
          user_id: user.id)
        user
      end
    end
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = token_twitter
      config.access_token_secret = secret_twitter
    end
  end
	
end
