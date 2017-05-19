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
    # member do
    #   ticket 'update'
    # end
  end

  namespace :support do
    resources :user, only: [:show]
    resources :dashboard, only: [:index]
    resources :tickets
    resources :invoices, only: [:index, :show]
  end

  resources :invoices, shallow: true do
    resources :payments, only: [:new, :create]
  end

  resources :orders
  resources :reports, only: [:index]

end
