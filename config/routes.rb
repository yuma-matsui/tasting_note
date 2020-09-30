Rails.application.routes.draw do
  devise_for :users
  resources :wines, only: [:index]
end
