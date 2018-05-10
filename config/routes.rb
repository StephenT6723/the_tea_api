Rails.application.routes.draw do
  	devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  	#authenticated :user do
    	#root 'static_pages#home', as: 'authenticated_root'
  	#end
  	#devise_scope :user do
   		#root 'devise/sessions#new'
  	#end
  	root 'static_pages#home'
	resources :events,          only: [:create, :index]
end
