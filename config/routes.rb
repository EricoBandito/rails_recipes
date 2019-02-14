Rails.application.routes.draw do

  resources :recipes, only: [:index, :show]
  get "/pages/:page" => "pages#show"

  root to: 'recipes#index'
end
