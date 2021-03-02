Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :sessions
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :photos, only: [:create]
  end
end
