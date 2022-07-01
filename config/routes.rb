Rails.application.routes.draw do
  resources :investments, only: :create
  resources :campaigns, only: :index
end
