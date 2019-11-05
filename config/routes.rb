Rails.application.routes.draw do
  root "homes#index"

  namespace :admin do
    # get 'sessions/new'
    # get 'sessions/create'
    # get 'sessions/destroy'
    resources :sessions, only: [:new, :create, :destroy]
    # get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get '', to: 'admins#dashboard', as: 'dashboard'
    get 'resetpass', to: 'admins#resetpass', as: 'resetpass'
    post 'reset', to: 'admins#send_reset_mail', as: 'send_reset_mail'
  end

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  
  resources :users, except: [:new]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
