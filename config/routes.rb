Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_for :property_owners

  resources :properties do
    resources :property_reservations, shallow: true
  end

  resources :property_types, only: [:show, :new, :create, :edit, :update]
  resources :property_regions, only: [:show, :new, :create, :edit, :update]
end