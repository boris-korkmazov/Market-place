Rails.application.routes.draw do

  devise_for :users

  root "home#index"

  resources :users do
    get :validate, on: :collection
  end

  resources :lessons do
    get :likes,  on: :member
    resources :comments, only: [:create]
  end
end
