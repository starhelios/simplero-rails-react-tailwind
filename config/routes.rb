Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: "api/sessions" },
                       path_names: { sign_in: :login }
  end

  namespace :api do
    get '/groups', to: 'groups#index'
    get '/groups/:uuid', to: 'groups#show'
    post 'groups', to: 'groups#create'
    put 'groups/:uuid', to: 'groups#update'
    delete 'groups/:uuid', to: 'groups#destroy'

    get 'posts/:id', to: 'posts#show'
    post 'posts', to: 'posts#create'
    put 'posts/:id', to: 'posts#update'
    delete 'posts/:id', to: 'posts#destroy'

    post 'comments', to: 'comments#create'
    put 'comments/:id', to: 'comments#update'
    delete 'comments/:id', to: 'comments#destroy'

    get '/users', to: 'users#index'
  end

  root 'homepage#index'
  get '*path', to: 'homepage#index'
end
