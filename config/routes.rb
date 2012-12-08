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
  
  # Routes for static pages
  get '/home' => 'static#home'
  get '/how_it_works' => 'static#how_it_works'
  get '/our_team' => 'static#our_team'
  get '/coming_soon' => 'static#coming_soon'
  
  #  Routes for sessions
  get '/signin' => 'sessions#new', :as => 'signin'
  get '/signout' => 'sessions#destroy', :as => 'signout'
  post '/session' => 'sessions#create'
  
  # Routes for mockups
  get "/mockups/client_signup" => 'mockups#client_signup'
 
end
