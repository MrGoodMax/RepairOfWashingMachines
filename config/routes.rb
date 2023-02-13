Rails.application.routes.draw do
  root 'pages#index'

  resources :contacts
  resources :abouts
  resources :prices
  resources :services
  resources :comments
end
