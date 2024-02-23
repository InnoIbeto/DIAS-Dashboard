Rails.application.routes.draw do
  get 'npk_level_data/NPK_level_data_page'
  get 'ph_level_data/ph_level_data_page'
  get 'moisture_data/moisture_data_page'
  get 'suggestions/suggestions_page'
  get 'dashboard/dashboard_page'
  # get 'home/index'
  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
