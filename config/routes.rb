Rails.application.routes.draw do
  get '/auth/:provider/callback' , to: 'sessions#create'

  resources :genres , :users
  resources :videos do
    resources :reviews
  end

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root 'application#home'

end
