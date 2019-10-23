Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
