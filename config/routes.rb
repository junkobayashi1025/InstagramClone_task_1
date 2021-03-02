Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
