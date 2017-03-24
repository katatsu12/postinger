class Post < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :user
  before_create :post_to_twitter, :post_to_facebook

  def post_to_twitter
    user.twitter.update(body)
  end

  def post_to_facebook
  #  user.facebook.put_connections("me", "feed", message: "#{@post}")
  end
end
