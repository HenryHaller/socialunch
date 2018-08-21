Rails.application.routes.draw do
  get 'lunch_date/show'
  get 'lunch_request/new'
  get 'lunch_request/create'
  get 'lunch_request/show'
  get 'lunch_request/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :lunch_request, only: [:new, :create, :show, :destroy]
  resources :lunch_date, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
