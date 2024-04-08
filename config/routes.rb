Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  devise_for :users

  get 'npk_level_data/NPK_level_data_page'
  get 'ph_level_data/ph_level_data_page'
  get 'moisture_data/moisture_data_page'
  get 'suggestions/suggestions_page'
  get 'dashboard/dashboard_page'
  
  root "home#index"
  
  devise_scope :user do
    get '/users/sign_out', to:'devise/sessions#destroy'
  end

  post 'moisture_data/moisture_data_page', to: 'moisture_data#create'
  post 'npk_level_data/NPK_level_data_page', to: 'npk_level_data#create'

  get "up" => "rails/health#show", as: :rails_health_check
end
