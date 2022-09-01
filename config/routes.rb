Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post :login, to: 'sessions#login'
    end
  end

  root 'homepage#index'
  get '*path', to: 'homepage#index'
end
