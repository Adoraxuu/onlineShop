# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products do
    resources :comments, shallow: true, only: %i[create destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :products, only: [] do
        member do
          patch :like # /api/v1/products/:id/like
        end
      end
    end
  end

  # 原理：
  # /products/2 show
  # POST /products/2/comments, to: "comments#create"
  # DELETE /comments/3, to: "comments#destroy"

  resource :cart, only: %i[show create destroy]
  resources :cart_items, only: [:destroy]

  resource :users, except: [:destroy] do
    collection do
      get :sign_in # 登入表單
    end
    resource :sessions, only: %i[create destroy]
  end
  # pages = pages controller
  # about = action /method
  # get '/products/new', to: 'products#new', as: :new_product
  # post '/products', to: 'products#create'
  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: :product
  # patch '/products/:id', to: 'products#update'
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product

  root 'products#index'

  get '/about', to: 'pages#about', as: :about # about_path
  get '/privacy', to: 'pages#privacy'
  get '/users/sign_in', to: 'users#sign_in'
end
