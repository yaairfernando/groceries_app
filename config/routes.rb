Rails.application.routes.draw do
  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :groups, only: %i[new create show]
  resources :users, only: %i[show new create]

  get 'groups', to: 'users#groups'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
