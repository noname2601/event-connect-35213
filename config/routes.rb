Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'likes/create'
  get 'likes/destroy'
  devise_for :performers
  root to: 'introductions#index'

  resources :introductions do
    resources :messages, only: :create
    resource :likes, only: [:create, :destroy]
  collection do
    get 'search'
   end
  end
  
  resources :performers, only: :show
end

