Rails.application.routes.draw do
  authenticated :user, ->(user) { user.store? } do
    get '/admin', to: 'admin#index'
    get '/admin/request/:id', to: 'admin#show_request', as: 'admin_request'
    post '/admin/request/:id', to: 'admin#dismiss_request', as: 'dismiss_request'
    get '/admin/request/:id/accept', to: 'admin#accept_request', as: 'accept_request'
  end
  
  get '/requests', to: 'requests#index'
  post '/requests', to: 'requests#create'
  get '/requests/new', to: 'requests#new'
  get '/requests/:id', to: 'requests#show', as: 'request'
  patch '/request/:id', to: 'admin#assign_price'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  devise_for :users
  # Defines the root path route ("/")

end
