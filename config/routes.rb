Rails.application.routes.draw do
  root 'sessions#new'
  resources :users do
    member do
      get :favorite
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
