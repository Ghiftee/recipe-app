Rails.application.routes.draw do
  resources :foods
  devise_for :users
  root to: 'recipes#index'
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
