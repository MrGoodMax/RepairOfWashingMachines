Rails.application.routes.draw do
  resources :users, only: %i[new create]

  root 'pages#index'

  resources :contacts
  resources :abouts
  resources :prices
  resources :services
  resources :comments
end
