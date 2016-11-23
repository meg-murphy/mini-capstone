Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "products#products_home"
  get "/all_products", to: "products#index"

  get "/all_products/new", to: "products#new"
  post "/all_products", to: "products#create"

  post "/search", to: "products#search"

  get "/all_products/:id/edit", to: "products#edit"
  patch "/all_products/:id", to: "products#update"

  get "/all_products/:id", to: "products#show"

  delete "/all_products/:id", to: "products#destroy"

  get "/suppliers", to: "suppliers#index"

end
