Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  resources :users, only: [:create]

  root 'welcome#home'





  # post '/signup' => 'users#create'
  # get '/login' => ''
  # root ''

  # root 'application#hello'
  # get '/login' => 'sessions#new'

  # A signup page, where the user enters their username (as name), password, and password confirmation.
  # A login page, where the user submits their username (as name) and password and are then logged in.
  # A user homepage, which says, "Hi, #{name}."

end
