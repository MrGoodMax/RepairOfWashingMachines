# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]

  root 'clients#index'

  resources :contacts
  resources :abouts
  resources :prices
  resources :services
  resources :reviews do
    resources :comments, only: %i[create]
  end

end
