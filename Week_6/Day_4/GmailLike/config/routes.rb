Rails.application.routes.draw do
  resources :emails do
    collection do
      get :show_email
    end
  end
  root to: "emails#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
