Rails.application.routes.draw do
  devise_for :admins
	root 'dashboard#index'
end
