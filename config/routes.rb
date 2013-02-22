Mybook::Application.routes.draw do

  get "carts/new"

  get "carts/create"

  get "carts/add"

  get "carts/remove"

  resources :books

  root :to => 'books#index'
end
