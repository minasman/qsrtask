Rails.application.routes.draw do
  resources :comment_updates
  resources :guests
  resources :comments
  resources :stores
  root 'sessions#index'
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
