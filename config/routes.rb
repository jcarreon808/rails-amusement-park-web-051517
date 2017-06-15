Rails.application.routes.draw do
root 'static#index'
resources :users

get '/signin' => 'sessions#new'
resources :sessions, only: [ :create, :destroy]
resources :attractions do
  member do
    post 'ride'
  end
end
end
