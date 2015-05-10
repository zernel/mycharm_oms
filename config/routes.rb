Rails.application.routes.draw do
  resources :stores
  devise_for :admins
	root 'dashboard#index'
end
