Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_for :property_owners

  get 'my_profile', to: 'users#my_profile'

  resources :properties do
    resources :property_reservations, shallow: true do
      post 'accept', on: :member
    end
  end

  resources :property_types, only: [:show, :new, :create, :edit, :update]
  resources :property_regions, only: [:show, :new, :create, :edit, :update]
end