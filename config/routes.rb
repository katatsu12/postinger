Rails.application.routes.draw do
  resources :accounts
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :posts
  root 'posts#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: %i[get patch], :as => :finish_signup
  post '/send_tweet', to: 'posts#send_tweet'
  post '/send_vk', to: 'posts#send_vk'
  get  '/get_vk_token', to: 'accounts#get_vk_token'
  resources :accounts
end
