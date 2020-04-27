Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'toppages/index'
    resources :works
    # root to: 'toppages#index'
    root to: 'works#index'
    # root to:'toppages#index'
    get 'signup', to: 'users#new'
    get 'login', to:'sessions#new'
    post 'login', to:'sessions#create'
    delete 'logout', to:'sessions#destroy'

    resources :users, only: [:index, :show, :new, :create] do
      member do
        get :followings
        get :followers
      end
      collection do
        get  :search
      end
      
    end
    resources :relationships, only: [:create, :destroy]

end
