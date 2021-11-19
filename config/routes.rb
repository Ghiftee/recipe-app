Rails.application.routes.draw do
  root to: 'recipes#index'

  devise_for :users
  resources :foods

  resources :recipes do
    resources :recipe_foods, only: %i[new]
  end

  resources :recipe_foods, only: %i[edit update destroy create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
