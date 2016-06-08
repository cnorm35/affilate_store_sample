Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :subscriptions, only: [:create]
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'toys' => 'products#toys'
  get 'apparel' => 'products#apparel'
  get 'accessories' => 'products#accessories'
  get 'home_goods' => 'products#home_goods'
  get 'most_popular' => 'products#most_popular'
  get 'test' => 'pages#test'
  get 'admin' => 'admin#dashboard'
end
