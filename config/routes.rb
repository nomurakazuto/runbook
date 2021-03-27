Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks, only: [:index, :new, :create, :edit, :update] do
    member do
      post :finishment
      get :favorites
      post :favorite
      post :complete
    end
  end
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:new, :create]
  
end
