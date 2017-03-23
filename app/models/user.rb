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
      user.token_twitter = auth.credentials.token
      user.secret_twitter = auth.credentials.secret
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

  def to_twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = 'DwFZ3JFjUvQl4b1oJIQos3ghT'
      config.consumer_secret     = 'q6W8qpEDRuOln8GQIfFrtKPWlQw73qbohQl4EBjo6VWHMORa9D'
      config.access_token        = token_twitter
      config.access_token_secret = secret_twitter
    end
  end
end
