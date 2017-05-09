Rails.application.routes.draw do
  devise_for :users
  # , controllers: { registrations: 'registrations' }
  root 'welcome#index'

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  # resources :users
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
