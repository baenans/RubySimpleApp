Rails.application.routes.draw do
  root 'static_pages#home'

  get 'home',  to: 'static_pages#home'
  get 'help',  to: 'static_pages#help'
  get 'about', to: 'static_pages#about'

  resources :users
  get 'users/new'
  post '/users/new', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
