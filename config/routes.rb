require 'sidekiq/web'

Rails.application.routes.draw do
  resources :chassis
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  
  devise_for :users

  get '/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  resources :engines

  root to: 'home#index'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/calendar', to: 'home#calendar'
  resources :tracks

end
