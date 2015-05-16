Rails.application.routes.draw do
  resources :categories
  resources :orders
  resources :products
  resources :stores
  devise_for :admins
	root 'dashboard#index'
end
