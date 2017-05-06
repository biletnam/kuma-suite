Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  # unauthenticated do
  #    root :to => 'home#index'
  # end
  #
  # authenticated do
  #   root :to => 'dashboard#index'
  # end

  resources :users
  resources :sessions
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :dashboard, only: [:index]
  resources :calendar, only: [:index]
  resources :tickets
  # resources :users, only: [:index, :show]
    # resources :reviews, only: [:create, :destroy]
  # end
  # resources :messaging
  resources :invoices
  resources :orders
  resources :reports, only: [:index]
end
