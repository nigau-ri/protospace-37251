Rails.application.routes.draw do
  devise_for :users
  root "prototypes#index"
  get "/users", to: "prototypes#edit"
  resources :prototypes do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:edit, :update, :show]
end
