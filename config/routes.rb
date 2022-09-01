Rails.application.routes.draw do

  devise_for :users
  root 'homepage#index'
  get 'groups', to: 'groups#index'
  post 'groups', to: 'groups#create'
  delete 'groups', to: 'groups#destroy'
  post 'join_group', to: 'groups#request_to_join'
end
