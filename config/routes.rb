Rails.application.routes.draw do

  root to: "reports#feed"

  # Comments controller
  patch 'like/:comment_id', to: "comments#like", as: :like
  patch 'dislike/:comment_id', to: "comments#dislike", as: :dislike
  resources :comments

  # Sessions controller
	get 'login', to: "sessions#new", as: :login
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy", as: :logout

  # Users controller
  resources :users
  get 'users/:id', to: "users#show", as: :show_user

  # Reports controller
  resources :reports
  get 'feed', to: "reports#feed", as: :feed

  # Reset password controller
  get 'reset_password/search'

  get 'reset_password/search', to: "reset_password#search", as: :reset_password
  post 'reset_password/search', to: "reset_password#recover"
end
