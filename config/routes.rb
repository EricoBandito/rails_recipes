Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'

  root to: 'recipes#index'
end
