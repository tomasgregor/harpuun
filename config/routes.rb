Harpuun::Application.routes.draw do

  root :to => 'static#home'  
  
  resources :clients do
    resources :projects
  end
  
  get '/starters/:starter_id/projects' => 'projects#index_starter', :as => 'starter_projects'
  get '/starters/:starter_id/offered/:id' => 'projects#show_starter_offered', :as => 'starter_offered_project'
  put '/starters/:starter_id/offered/:id/accept' => 'projects#accept_project', :as => 'accept_project'
  put '/starters/:starter_id/offered/:id/reject' => 'projects#reject_project', :as => 'reject_project'
  
  resources :starters
  
  resources :skills
  

  
  #  Routes for sessions
  get '/client_signin' => 'client_sessions#new', :as => 'signin_client'
  get '/client_signout' => 'client_sessions#destroy', :as => 'signout_client'
  post '/client_session' => 'client_sessions#create'
  
  get '/starter_signin' => 'starter_sessions#new', :as => 'signin_starter'
  get '/starter_signout' => 'starter_sessions#destroy', :as => 'signout_starter'
  post '/starter_session' => 'starter_sessions#create'
  
  # Routes for static pages
  get '/home' => 'static#home'
  get '/how_it_works' => 'static#how_it_works'
  get '/our_team' => 'static#our_team'
  
  # Routes for mockups
  get "/mockups/client_signup" => 'mockups#client_signup'
 
end
