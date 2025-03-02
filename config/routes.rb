Rails.application.routes.draw do
  root "static#index"

  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :users
  scope '/admin' do
    resources :users
  end

  resources :roles

  get "rolunk", to: "static#about"
  
end
