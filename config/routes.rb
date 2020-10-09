Rails.application.routes.draw do
  devise_for :users
  get "wines/home", to: "wines#home"
  root to: "wines#home"
  resources :wines, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get  'new_look'
      post 'create_look'
      get 'new_flavor'
      post 'create_flavor'
      get 'new_taste'
      post 'create_taste'
    end
  end
end
