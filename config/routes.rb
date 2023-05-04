require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/calendar', to: 'home#calendar'
  resources :tracks do
    put :update_image, on: :member
  end

end
