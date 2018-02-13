Rails.application.routes.draw do
  devise_for :users
  resources :pets, except: :destroy
  resources :locations, except: :destroy
  resources :pet_categories, except: :destroy
  root 'pets#index'
end
