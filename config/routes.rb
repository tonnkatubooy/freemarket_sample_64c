Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'items#index'
  resources :items, only: [:index, :show] do
    member do
      get 'purchase'
     end
  end 
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update]
  end
  resources :cards, only: [:index, :new]
end
