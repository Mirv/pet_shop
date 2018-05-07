Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :locations
    resources :pets
    resources :pet_categories
    resources :user_details

    root to: "pets#index"
  end

  devise_for :users
  resources :pets, except: :destroy
  resources :locations, except: :destroy
  resources :pet_categories, except: :destroy
  root 'pets#index'
end
