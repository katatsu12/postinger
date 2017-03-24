Rails.application.routes.draw do
  resources :accounts
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  #resources :users
  resources :posts
  root 'posts#index'
  get '/', to: 'post#index'
end
