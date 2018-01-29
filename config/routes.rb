Rails.application.routes.draw do
  devise_for :users
  resources :pets
  resources :locations
  resources :pet_categories
  root 'pets#index'
end
