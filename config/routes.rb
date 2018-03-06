Rails.application.routes.draw do
  resources :shows
  resources :actors
  resources :users
  resources :session
  get '/', to: "application#welcome", as: 'root'
  get '/logout', to: "session#logout", as: 'logout'
  get '/login', to: "session#new", as: "login"
  get '/users/:id/following', to: "users#following"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
