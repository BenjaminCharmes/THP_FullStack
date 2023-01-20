Rails.application.routes.draw do
  devise_for :users
  root to: "emails#index"
  resources :emails, only: %i[show create destroy update]
  resources :tasks, except: [:show]
  resources :home, only: [:index]
end
