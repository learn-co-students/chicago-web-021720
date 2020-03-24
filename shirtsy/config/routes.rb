Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shirts do
    resources :sales, only: [:new, :create]
  end

  resources :sales, only: [:index]
  resources :users, except: [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create]
  
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  get "/", to: "application#welcome"
  root "shirts#new"
end
