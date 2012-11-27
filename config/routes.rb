Harpuun::Application.routes.draw do
 
  resources :projects

  resources :skills

  resources :starters

  resources :contractors

  root :to => 'static#home'
  
  #  Routes for sessions
  get '/contractor_signin' => 'contractor_sessions#new', :as => 'signin_contractor'
  get '/contractor_signout' => 'contractor_sessions#destroy', :as => 'signout_contractor'
  post '/contractor_session' => 'contractor_sessions#create'
  
  get '/starter_signin' => 'starter_sessions#new', :as => 'signin_starter'
  get '/starter_signout' => 'starter_sessions#destroy', :as => 'signout_starter'
  post '/starter_session' => 'starter_sessions#create'
  
  # Routes for static pages
  get '/home' => 'static#home'
  get '/how_it_works' => 'static#how_it_works'
  get '/our_team' => 'static#our_team'
  
  # Routes for mockups
  get "/mockups/contractor_signup" => 'mockups#contractor_signup'
 
end
