Rails.application.routes.draw do
 root to: "toppages#index"
 resources :tasks, only: [:new, :create, :edit, :update]
 
end
