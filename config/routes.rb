Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/secret' => 'secrets#show'
  get '/secret' => 'secrets#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
