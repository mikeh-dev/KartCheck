require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  
  turbo_frames

  devise_for :users

  get 'engines/search', to: 'engines#search'


  root to: 'home#index'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/calendar', to: 'home#calendar'
  resources :tracks

end
