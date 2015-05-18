Rails.application.routes.draw do
	root 'dashboard#index'
  devise_for :admins

  resources :categories
  resources :orders do
    patch :handle, on: :member
  end
  resources :products
  resources :stores
end
