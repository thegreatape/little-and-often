Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  resources :users
  resources :activities
  resources :activity_entries
  resources :color_tests
end
