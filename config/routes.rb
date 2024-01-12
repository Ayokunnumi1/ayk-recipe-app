Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check

  root "foods#index"
  resources :users, only: [:index]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index, :show]
  resources :ingredients, only: [:new, :create]
end
