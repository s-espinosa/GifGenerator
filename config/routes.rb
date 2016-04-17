Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create]
  resources :gifs, only: [:index]
  resources :favorites, only: [:new, :index, :create]
  namespace :admin do
    resources :categories, only: [:index, :new, :show, :create, :destroy] do
      resources :gifs,     only: [:new, :create]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
