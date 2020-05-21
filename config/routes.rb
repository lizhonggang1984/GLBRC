Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/newuser', to: 'users#new'

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
  root 'apps#index'
end
