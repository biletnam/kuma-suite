Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout'}

  # devise_for :users
  authenticated :user do
    # if :user.is_client?
      # root to: 'dashboard#index'
      root to: 'passthrough#index'
    # end
  end


  # , controllers: { registrations: 'registrations' }
  #
  # devise_scope :user do
  #   authenticated :user do
  #     root 'welcome#index', as: :authenticated_root
  #   end
  #
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end


  # resources :users
  # resources :sessions

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :dashboard, only: [:index]
  resources :calendar, only: [:index]
  resources :tickets do
    resources :comments
  end
  resources :support
  # resources :users, only: [:index, :show]
    # resources :reviews, only: [:create, :destroy]
  # end
  # resources :messaging
  resources :invoices
  resources :orders
  resources :reports, only: [:index]

end
