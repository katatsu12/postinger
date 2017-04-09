class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = '@'.freeze
  TEMP_EMAIL_REGEX = /\Achange@me/

  has_many :posts
  has_many :accounts
  has_many :rssfeeds

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  #validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Account.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email
      if user.nil?
        user = User.new(
          password: Devise.friendly_token[0, 20],
          email: "#{auth.uid}#{TEMP_EMAIL_PREFIX}#{auth.provider}.com"
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  # get current user
  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

  def twitter
    secret = Account.where(provider: 'twitter').first
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = secret.token_tw
      config.access_token_secret = secret.secret_tw
    end
  end

  def facebook
    secret = Account.where(provider: 'facebook').first
    @facebook ||= Koala::Facebook::API.new(secret.token_fb)
  end

  def vk
    secret = Account.where(provider: 'vkontakte').first
    @vk = VkontakteApi::Client.new(secret.token_vk)
  end
end
