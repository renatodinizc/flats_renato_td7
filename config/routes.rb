Rails.application.routes.draw do
  devise_for :property_owners
root to: 'home#index'

resources :properties, only: [:show, :new, :create, :edit, :update]
resources :property_types, only: [:show, :new, :create, :edit, :update]
resources :property_regions, only: [:show, :new, :create, :edit, :update]
end
