Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :charities, only: [:index, :show] do
    resources :needs
  end
  get '/dashboard', to: 'pages#dashboard'
  get '/onboarding', to: 'pages#onboarding'
end
