Rails.application.routes.draw do
  devise_for :users
  root to: "wines#index"
  resources :wines, only: [:index, :new, :create] do
    resources :looks, only: [:create]
    resources :flavors, only: [:create]
    resources :tastes, only: [:create]
  end
end
