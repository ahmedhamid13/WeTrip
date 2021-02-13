Rails.application.routes.draw do

  namespace :en do
    resources :destinations, only: [:index, :show]
    resources :trips, only: [:show]
    resources :days, only: [:index, :show]
    resources :schedules, only: [:index, :show]
    resources :offers, only: [:index, :show]

    root to: 'statics#home', as: 'home'
    get 'images', to: 'statics#images', as: 'images'
    get 'about', to: 'statics#about', as: 'about'
    resources :contacts, only: [:new, :create]
  end

  namespace :ar do
    resources :destinations, only: [:index, :show]
    resources :trips, only: [:show]
    resources :days, only: [:index, :show]
    resources :schedules, only: [:index, :show]
    resources :offers, only: [:index, :show]

    root to: 'statics#home', as: 'home'
    get 'images', to: 'statics#images', as: 'images'
    get 'about', to: 'statics#about', as: 'about'
    resources :contacts, only: [:new, :create]
  end

  scope "(:locale)", locale: /ar/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users
    resource :dashboard do
      collection do
        get :report
      end
    end
  end

  # post 'ar/trips/:id', to: 'book_trips#book_trip', as: 'ar_book_trip'
  
  resources :posts, only: [:index, :show]
  resources :reviews, only: [:index, :show, :new, :create]
  post 'en/trips/:id', to: 'book_trips#book_trip_en', as: 'en_book_trip'
  post 'ar/trips/:id', to: 'book_trips#book_trip_ar', as: 'ar_book_trip'
  root to: "ar/statics#home", as: 'home'
end
