class CallbacksController < Devise::OmniauthCallbacksController

  def twitter
    @user = User.from_twitter(auth_hash)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else 
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private

  def auth_hash
    request.env["omniauth.auth"] 
  end
end
