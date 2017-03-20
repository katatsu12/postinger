class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect @user
  end

  def twitter
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect @user
  end

  private

  def auth_hash
    request.env["omniauth.auth"] 
  end
end
