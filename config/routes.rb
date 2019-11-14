Rails.application.routes.draw do
  
  get 'partner/login' => 'partner_sessions#new', as: 'partner_login'
  post 'partner/login' => 'partner_sessions#create'
  delete 'partner/signout' => 'partner_sessions#destroy'
  get 'partner/signup' => 'partners#new'
  post 'partner/signup' => 'partners#create'
  
  resources :partners, except: [:new]

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
    get 'newpassword' => 'reset_password#edit', as: 'new_password'
  end

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'get_district' => 'homes#get_district'
  get 'staff_search' => 'partners#search', as: 'staff_search'
  
  resources :users, except: [:new]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :partner_password_resets, only: [:new, :create, :edit, :update]
  resources :partner_change_password
end
