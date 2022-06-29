Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :charities, only: [:index, :show, :new, :create] do
    resources :needs, only: [:new, :create]
  end
  resources :companies, only: [:new, :create]
  resources :users, only: [:update]
  get '/dashboard', to: 'pages#dashboard'
  get '/onboarding', to: 'pages#onboarding'
end
