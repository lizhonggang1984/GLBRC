Rails.application.routes.draw do


  get 'login' => 'sessions#login'
  post 'create_login' => 'sessions#create_login'
  get 'signup' => 'sessions#signup'
  post 'create_user' => 'sessions#create_user'
  get 'logout' => 'sessions#logout'

  get 'firstpage' => 'apps#index'

  get '/apps/remove/:id', to: 'apps#remove', as: 'remove'
  get '/apps/first/:id', to: 'apps#first', as: 'first'
  get '/apps/addback/:id', to: 'apps#addback', as: 'addback'

  resources :apps do
    collection do
      get 'admin'
      get 'index'
      get 'indexTest'
      get 'index_notSelect'
      get 'getOrder'
    end
  end

  resources :users do
    collection do
      get 'admin'
      get 'index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#login'
end
