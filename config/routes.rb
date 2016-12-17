Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :recipes do
    resources :reports
  end
  # get "recipes/:recipe_id/reports/new" => "reports#new"
  # post "recipes/:recipe_id/reports/" => "reports#create"

  get "user/:id" => "user_show#show"
end
