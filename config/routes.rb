Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :dashboard, only: [:index]
  resources :calendar, only: [:index]
  resources :tickets, only: [:index, :show]
  # resources :users, only: [:index, :show]
    # resources :reviews, only: [:create, :destroy]
  # end
  # resources :messaging
  resources :invoices
  resources :orders
  resources :reports, only: [:index]
end
