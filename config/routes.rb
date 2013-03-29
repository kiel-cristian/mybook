Mybook::Application.routes.draw do

  resources :books

  resources :carts, only: [ :checkout, :confirm_data, :pay ] do
   member do
    get 'add_item'
    delete 'remove_item'
    post 'checkout'
    post 'confirm_data'
    post 'pay'
   end
  end

  root :to => 'books#index'
end
