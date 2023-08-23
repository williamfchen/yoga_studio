Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/studios", to: "studios#index"
  get "/studios/new", to: "studios#new"
  post "/studios", to: "studios#create"
  get "/studios/:id", to: "studios#show"

  get "/yogis", to: "yogis#index"
  get "/yogis/new", to: "yogis#new"
  post "/yogis", to: "yogis#create"
  get "/yogis/:id", to: "yogis#show"
  
end
