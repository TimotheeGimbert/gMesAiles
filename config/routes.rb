Rails.application.routes.draw do
  root "emails#index"
  resources :emails, only: [:index, :create, :show, :destroy]
end
