VideoStore::Application.routes.draw do

  root to: 'videos#index'
  resources :videos, only: [:show] do
    resources :purchases, only: [:new, :create]
  end

  resource :session

  resources :users, only: [:new, :create]

  namespace :admin do
    root to: 'dashboard#show'
    resources :videos
    resources :users, only: [:index, :update]
  end
end
