Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :sessions
  resources :posts do
    resources :photos, only: [:create]
  end
end
