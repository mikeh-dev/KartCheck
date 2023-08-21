require 'sidekiq/web'

Rails.application.routes.draw do
  get 'errors/not_found'
  resources :chassis
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  
  devise_for :users

  get '/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  get '/search', to: 'search#index'

  resources :engines

  root to: 'home#index'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#new_contact', as: :new_contact
  get '/calendar', to: 'home#calendar'

  post 'create_contact', to: 'home#create_contact', as: :create_contact

  get '/contact_form', to: 'contact_form#index'

  get '*path', to: 'errors#not_found', via: :all
  
end
