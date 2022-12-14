Rails.application.routes.draw do
  devise_for :users
  root "homepage#index"
  get "groups", to: "groups#index"
  post "groups", to: "groups#create"
  delete "groups", to: "groups#destroy"
  patch "group/:id", to: "groups#update"
  post "join_group", to: "groups#request_to_join"
  post "update_request", to: "groups#approve_or_reject_request"
  post "remove_member", to: "groups#remove_member"
  get "group/:uuid", to: "groups#show", as: "group"
  get "health_check", to: "homepage#health_check"
  resources :posts
  resources :comments
  resources :images, only: [:create]
end
