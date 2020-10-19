Rails.application.routes.draw do
  devise_for :users
  get "wines/home", to: "wines#home"
  get "wines/notes", to: "wines#notes"
  get "wines/color", to: "wines#color"
  get "wines/country", to: "wines#country"
  get "wines/grape", to: "wines#grape"
  get "articles/category", to: "articles#category"
  root to: "wines#home"
  resources :wines do
    resources :favorites, only: [:index, :create, :destroy]
    collection do
      get  'new_look'
      post 'create_look'
      get 'new_flavor'
      post 'create_flavor'
      get 'new_taste'
      post 'create_taste'
    end
  end
  resources :users, only: [:show]
  resources :articles, only: [:show, :index]
end
