Rails.application.routes.draw do
  resources :accounts
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :posts
  root 'posts#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  post '/send_tweet', to: 'posts#send_tweet'
end
