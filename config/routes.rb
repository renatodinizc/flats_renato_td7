Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, path: 'users'
  devise_for :property_owners, path: 'property_owners'

  resources :properties do
    get 'my_properties', on: :collection
  end

  resources :property_types, only: [:show, :new, :create, :edit, :update]
  resources :property_regions, only: [:show, :new, :create, :edit, :update]
end
