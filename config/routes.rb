Rails.application.routes.draw do
  resources :homepage, only: [:index]
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :reports
  resources :transactions
end
