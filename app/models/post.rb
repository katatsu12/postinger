class Post < ApplicationRecord
  belongs_to :user
  before_create :post_to_twitter

  def post_to_twitter
    user.to_twitter.update(body)
  end
end
