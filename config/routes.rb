# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]

  root 'clients#index'

  resources :contacts
  resources :abouts
  resources :prices
  resources :services
  resources :comments
end
