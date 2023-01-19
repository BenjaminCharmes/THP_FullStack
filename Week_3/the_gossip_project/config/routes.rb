Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root to: 'gossip#index'

  # Controller Gossip
  resources :gossip do
    resources :comment
  end

  # Controller User
  resources :user

  # Controller City
  resources :city

  # Controller Sessions
  resources :sessions, only: [:new, :create, :destroy]
  
  # Controller Likes
  resources 'likes', only: [:new, :destroy]

  # URL cachée
  get '/welcome/:first_name', to: 'welcome#home', as: 'welcome_home'

  # Page Team
  get '/team', to: 'team#home'

  # Page Contact
  get '/contact', to: 'contact#home'

end