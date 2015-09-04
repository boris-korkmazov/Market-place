Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :users do
    get :validate, on: :collection
  end
end
