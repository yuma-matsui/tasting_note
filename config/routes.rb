Rails.application.routes.draw do
  devise_for :users
  root to: "wines#index"
  resources :wines, only: [:index, :new, :create] do
    collection do
      get 'new_look'
      post 'create_look'
    end
  end
end
