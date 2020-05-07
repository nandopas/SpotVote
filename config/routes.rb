Rails.application.routes.draw do
  
  #get 'users/index'
  #get 'users/new'
  #get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root 'albums#index'
  root 'home#index'
  get 'home/index'

  #spotify authentication
  get '/auth/spotify/callback', to: 'users#spotify'
  

  resources :albums, except: [:update, :destroy, :create, :new, :edit] do
    member do
      get "like", to: "albums#vote"
    end
  end

  get '/search' => 'albums#search', :as => 'search_page'
  post '/search' => 'albums#create'

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  #signing in
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  #post 'login', to: 'sessions#create', as: 'session_create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  

end
