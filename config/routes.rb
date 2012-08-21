Openspace::Application.routes.draw do
  #omniauth
  match "/auth/:provider/callback" => "authentication#create"
  match "/signout" => "authentication#destroy", :as => :signout
  
  resources :users
  
  resources :events do
    member do
      get 'menu'
    end
    
    resources :agenda
    resources :locations
    resources :slots

    resources :sessions do 
      resources :votes
    end
  end

  #administration
  match "/admin" => "admin#index"
    
  #navigation
  match "/openspace" => "navigation#openspace"
  match "/about" => "navigation#about"
  
  root :to => 'navigation#index'

end