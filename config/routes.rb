Rails.application.routes.draw do
  resources :comment_updates
  resources :guests
  resources :comments do
    resources :comment_updates, only: [:new, :create, :index]
  end
  resources :stores
  root 'sessions#index'
  resources :users
  get '/open' => 'comments#open'
  get '/guest_comments' => 'comments#guest_comments'
  get '/find_comment' => 'comments#find'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/store_type' => 'stores#store_type'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
