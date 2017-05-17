Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :users, :only => [:show, :index]
  

  authenticated :user do
    root to: 'passthrough#index'
  end

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :dashboard, only: [:index]
  resources :calendar, only: [:index]

  resources :tickets do
    resources :comments
  end

  namespace :support do
    resources :tickets
  end
  # do i need :comments
  # do i need to make /supp/tikets/everything in there

  # resources :messaging
  resources :invoices
  resources :orders
  resources :reports, only: [:index]

end
