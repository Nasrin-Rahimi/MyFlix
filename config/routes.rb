Rails.application.routes.draw do

  get '/auth/:provider/callback' , to: 'sessions#create'

  resources :genres do
    resources :videos, only: [:create]
  end
  
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :videos, only: [:index, :show, :new, :edit, :update, :destroy]

  root 'application#home'

end
