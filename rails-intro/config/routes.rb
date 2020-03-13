Rails.application.routes.draw do
  resources :clowns
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get '/yo_yos', to: 'yo_yos#index', as: 'yoyos'

  resources :yo_yos, except: [:destroy, :edit, :update]
  resources :tricks, only: [:index, :show]
end
