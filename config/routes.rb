Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'albums#index'
 
  get '/albums/search' => 'albums#search', :as => 'search_page'
  post '/albums/search' => 'albums#create'


  resources :albums, except: [:update, :destroy, :show, :create, :new, :edit] do
    member do
      get "like", to: "albums#vote"
    end
  end


  
end
