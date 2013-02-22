Mybook::Application.routes.draw do

  resources :carts, only: [ :new, :create ] do
   member do
    resources :items
   end
  end

  root :to => 'books#index'
end
