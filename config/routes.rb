Rails.application.routes.draw do
  root to: 'posts#index'

  patch '/update_avatar', to: 'users#update_avatar', as: :update_avatar
  patch '/update_cover', to: 'users#update_cover', as: :update_cover

  post '/confirm_friend/', to: 'friendships#confirm'
  get '/friend_requests', to: 'users#new_friends', as: :friend_requests

  get '/send_message/:id', to: 'rooms#intialize_room', as: :intialize_room

  devise_for :users
  resources :users, only: [:index, :show] 
  resources :posts do
    post '/like', to: 'reactions#like', as: :like_action
    post '/dislike', to: 'reactions#dislike', as: :dislike_action
    resources :comments
  end
  resources :friendships, only: [:index, :create, :destroy, :update]
  resources :rooms, only: [:show, :index]
  resources :messages, only: [:create]
end
