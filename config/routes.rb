Rails.application.routes.draw do
  get :categories, to: 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes, only: [:index, :show]
end
