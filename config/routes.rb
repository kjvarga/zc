ActionController::Routing::Routes.draw do |map|
  map.resources :user_sessions
  map.resource :account, :controller => "users"
  map.root :controller => 'home'
    
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
