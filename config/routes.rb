Rails.application.routes.draw do
  devise_for :performers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'introductions#index'
  resources :introductions 
  resources :performers, only: :show
  resources :users, only: :index
end
