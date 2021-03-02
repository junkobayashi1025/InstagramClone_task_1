Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :sessions
  resources :posts, only: [:new, :create, :index] do
    resources :photos, only: [:create]
  end
end
