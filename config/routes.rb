Rails.application.routes.draw do
  root to: 'posts#index'

  get '/new_avatar', to: 'users#new_avatar', as: :new_avatar
  patch '/update_avatar', to: 'users#update_avatar', as: :update_avatar

  devise_for :users
  resources :posts do
    resources :comments
  end
end
