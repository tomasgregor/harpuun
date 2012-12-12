Harpuun::Application.routes.draw do

  root :to => 'static#home'  
  
  resources :clients do
    resources :projects
  end
  
  put '/clients/:client_id/projects/:id/reject' => 'projects#reject_starter', :as => 'reject_starter'
  
  get '/starters/:starter_id/projects' => 'projects#index_starter', :as => 'starter_projects'
  get '/starters/:starter_id/projects/:id' => 'projects#show_starter', :as => 'starter_project'
  put '/starters/:starter_id/projects/:id/accept' => 'projects#accept_project', :as => 'accept_project'
  put '/starters/:starter_id/projects/:id/reject' => 'projects#reject_project', :as => 'reject_project'
  
  resources :starters
  
  resources :skills
  
  # Routes for static pages
  get '/how_it_works' => 'static#how_it_works', :as => 'how'
  get '/our_team' => 'static#our_team', :as => 'team'
  get '/coming_soon' => 'static#coming_soon', :as => 'coming_soon'
  
  #  Routes for sessions
  get '/signin' => 'sessions#new', :as => 'signin'
  get '/signout' => 'sessions#destroy', :as => 'signout'
  post '/session' => 'sessions#create'
  
  # Routes for mockups
  get "/mockups/client_signup" => 'mockups#client_signup'
 
end
