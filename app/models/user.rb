class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         :omniauth_providers => [:facebook, :twitter, :vkontakte]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.account_id = @user_current
    end
  end

 def self.from_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.account_id = @user_current
      user.token_facebook = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
    end
  end

  def self.from_twitter(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.token_twitter = auth.credentials.token
      user.secret_twitter = auth.credentials.secret
      user.account_id = @user_current
    end
  end

  def self.from_vk(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.extra.raw_info.domain+'@vk.com'
      user.password = Devise.friendly_token[0,20]
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

  def facebook
    @facebook ||= Koala::Facebook::API.new(token_facebook)
  end

  def user_current
    @user_current = User.find(session[:user_id]) if session[:user_id]
  end
end
