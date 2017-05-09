Rails.application.routes.draw do
  # devise_for :users
  # , controllers: { registrations: 'registrations' }
  # root 'welcome#index'

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :sessions
  resources :dashboard, only: [:index]
  resources :tickets
  resources :calendar, only: [:index]
  resources :invoices
  resources :orders
  resources :reports, only: [:index]
  # resources :messaging

end
