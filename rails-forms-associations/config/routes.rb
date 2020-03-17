Rails.application.routes.draw do
  resources :students
  resources :cohorts

  # get  "/cohorts/:id", to: "cohorts#show", as: "cohort"
  # patch "/cohorts/:id", to: "cohorts#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
