Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new' 
  resources :users, only: [:index, :show, :new, :create] do
    resources :stop_smoking_infos, only: [:create] do
      member do
        get :smoking_fail
      end
    end
  end
  
  
end
