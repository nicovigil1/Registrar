Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "main#index"
  post "/", to: "sessions#create"

  resources :users, only:[:show, :new, :create]
  resources :registries, only: [:show]
end
