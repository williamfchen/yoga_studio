Rails.application.routes.draw do
  get "/", to: "welcome#index", as: :root

  get "/studios", to: "studios#index", as: :studios
  get "/studios/new", to: "studios#new", as: :new_studio
  post "/studios", to: "studios#create"
  get "/studios/:id", to: "studios#show", as: :studio
  get "/studios/:id/yogis", to: "studios#show_yogis", as: :show_studio_yogis
  get "studios/:id/yogis/new", to: "studios#add_yogi", as: :add_yogi
  post "studios/:id/yogis", to: "studios#create_yogi", as: :create_yogi
  get '/studios/:id/edit', to: 'studios#edit', as: :edit_studio
  patch '/studios/:id', to: 'studios#update', as: :update_studio

  get "/yogis", to: "yogis#index"
  get "/yogis/new", to: "yogis#new"
  post "/yogis", to: "yogis#create"
  get "/yogis/:id", to: "yogis#show"
end
