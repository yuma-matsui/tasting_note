Rails.application.routes.draw do
  devise_for :users
  root to: "wines#index"
  resources :wines, only: [:index, :new, :create] do
    collection do
      get 'new_look'
      post 'create_look'
      get 'new_flavor'
      post 'create_flavor'
      get 'new_taste'
      post 'create_taste'
    end
  end
end
