Rails.application.routes.draw do
  resources :accounts
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :posts
  resources :rssfeeds
  root 'posts#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  post '/send_tweet', to: 'posts#send_tweet'
  post '/send_vk', to: 'posts#send_vk'
  get  '/get_vk_token', to: 'accounts#get_vk_token'
  post '/send_fb', to: 'posts#send_fb'
  resources :accounts
  get '/:page', to: 'pages#show'
  match '/posts/rss' => 'posts#rss', via: [:get, :post], :as => :rss
end
