Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shirts, only: [:new, :create, :index, :show] do
    resources :sales, only: [:new, :create]
  end

  resources :sales, only: [:index]
  resources :users, only: [:show]

  get "/", to: "application#welcome"
  root "shirts#new"
end
