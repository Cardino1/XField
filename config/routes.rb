# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  resources :opportunities, only: %i[index new create]
  resources :investors, only: %i[index new create]
  resources :articles, only: %i[index show]
  resources :updates, only: %i[create]

  namespace :admin do
    root to: "dashboard#index"

    resources :articles
    resources :opportunities do
      member do
        patch :approve
        patch :reject
      end
    end
    resources :investors do
      member do
        patch :approve
        patch :reject
      end
    end
    resources :users, only: %i[index destroy]
  end
end
