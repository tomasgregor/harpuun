Harpuun::Application.routes.draw do
 
  resources :projects

  resources :skills

  resources :starters

  resources :contractors

  root :to => 'static#home'
  
  #  Routes for sessions
  get '/signin' => 'sessions#new_contractor', :as => 'signin_contractor'
  get '/signout' => 'sessions#destroy', :as => 'signout'
  post '/sessions/create_contractor' => 'sessions#create_contractor'
  
  # Routes for static pages
  get '/home' => 'static#home'
  get '/how_it_works' => 'static#how_it_works'
  get '/our_team' => 'static#our_team'
  
  # Routes for mockups
  get "/mockups/contractor_signup" => 'mockups#contractor_signup'
 
end
