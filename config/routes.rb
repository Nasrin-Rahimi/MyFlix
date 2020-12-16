Rails.application.routes.draw do
  get '/auth/:provider/callback' , to: 'sessions#create'
  
  get 'sessions/new'
  root 'application#home'
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
