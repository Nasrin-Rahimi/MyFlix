Rails.application.routes.draw do

  get '/auth/:provider/callback' , to: 'sessions#create'

  resources :genres , :users
  resources :videos do
    resources :reviews
  end

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # # OR scope '/admin', module: 'admin' do
  # namespace :admin do  
  #   resources :stats, only: [:index]
  # end

  root 'application#home'

end
