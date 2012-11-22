Harpuun::Application.routes.draw do
 
  resources :contractors

  root :to => 'static#home'
  
  #  Routes for sessions
  get '/login' => 'sessions#new', :as => 'signin'
  get '/logout' => 'sessions#destroy', :as => 'signout'
  post 'sessions/create' => 'sessions#create'
  
  # Routes for static pages
  get '/home' => 'static#home'
  get '/how_it_works' => 'static#how_it_works'
  get '/our_team' => 'static#our_team'
  
  # Routes for mockups
  get "/mockups/contractor_signup" => 'mockups#contractor_signup'
 
end
