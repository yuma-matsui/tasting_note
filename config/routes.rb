Rails.application.routes.draw do
  devise_for :users
  root to: "wines#index"
  resources :wines, only: [:index]
end
