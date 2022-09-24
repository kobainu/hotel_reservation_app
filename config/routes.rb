Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  get 'users/account'
  get 'users/profile', to: 'users#profile'
  post 'users/profile', to: 'users#update'

  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/show'
  get 'rooms/posts'
end
