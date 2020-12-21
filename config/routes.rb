Rails.application.routes.draw do

  get '/auth/:provider/callback' , to: 'sessions#create'

  resources :genres , :videos, :users
  resources :reviews, only: [:index, :show, :new, :create]

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root 'application#home'

end
