Rails.application.routes.draw do
 
  get "up" => "rails/health#show", as: :rails_health_check

  root "foods#index"
  resources :users, only: [:index]
  resources :foods, only: [:index, :show, :new]
  resources :recipes, only: [:index, :show, :new]
end
