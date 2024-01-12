Rails.application.routes.draw do
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check

  root "foods#index"
  resources :users, only: [:index]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index, :show]
  resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  resources :recipes do
  get 'shopping_list', on: :member
end
end
