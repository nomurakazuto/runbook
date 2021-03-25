Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  resources :tasks, only: [:index, :new, :create, :edit, :update] do
    member do
      post :finishment
      get :favorites
      post :complete
    end
  end
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:new, :create]
  
end
