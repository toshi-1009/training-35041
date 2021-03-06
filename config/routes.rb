Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "trainings#index"

  resources :trainings,  only: [:new, :create, :show, :edit, :update, :destroy] 
  resources :targets
end
