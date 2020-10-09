Rails.application.routes.draw do
  devise_for :users
  get "wines/home", to: "wines#home"
  get "wines/notes", to: "wines#notes"
  root to: "wines#home"
  resources :wines do
    collection do
      get  'new_look'
      post 'create_look'
      get 'new_flavor'
      post 'create_flavor'
      get 'new_taste'
      post 'create_taste'
      get 'color'
      get 'country'
      get 'grape'
    end
  end
end
