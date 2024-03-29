Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :charities do
    resources :needs, only: [:new, :create]
  end
  resources :needs, only: [:edit, :update, :destroy] do
    resources :claims, only: [:create]
  end
  resources :claims, only: [:show, :destroy] do
    patch 'approval', to: 'claims#approve'
    patch 'closing', to: 'claims#close'
  end

  resources :companies, only: [:new, :create, :edit, :update]

  get '/dashboard', to: 'pages#dashboard'
  get '/claims', to: 'pages#claims'
  get '/history', to: 'pages#history'
  # get '/onboarding', to: 'pages#onboarding'
end
