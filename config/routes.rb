Rails.application.routes.draw do
  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :groups, only: %i[new create show index]
  resources :purchases, only: %i[new create show index]
  resources :users, only: %i[show create]

  get 'external_transactions', to: 'users#external_transactions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
