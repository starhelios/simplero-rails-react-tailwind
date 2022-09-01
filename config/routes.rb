Rails.application.routes.draw do

  devise_for :users
  root 'homepage#index'
  get 'groups', to: 'groups#index'
end
