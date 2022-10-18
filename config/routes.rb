Rails.application.routes.draw do
  get 'top/main'
  resources :users
  root 'users#index'
  get 'users/new'
  post 'users/create'
  delete 'users/:id', to: 'users#destroy'
  
  get 'tweets/index'
  get 'tweets/new'
  post 'tweets/create'
  delete '/:id', to: 'tweets#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
