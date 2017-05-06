Rails.application.routes.draw do

  root 'welcome#index'

  resources :dashboard, only: [:index]
  resources :calendar, only: [:index]
  resources :tickets, only: [:index, :show]
  # resources :users, only: [:index, :show]
    # resources :reviews, only: [:create, :destroy]
  # end
  resources :messaging
  resources :invoices
  resources :orders
  resources :reports, only: [:index]

  resources :users
  resources :sessions

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
