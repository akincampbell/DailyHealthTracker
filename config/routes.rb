Rails.application.routes.draw do
  devise_for :users

  resources :inquiries, only: [:new, :create]

  # Daily Health Tracks and root routes
  root "health_checkins#index"

  # Routes for the Health checkin resource:

  # FORM PAGE
  get("/health_checkin", { :controller => "health_checkins", :action => "checkin_page" })

  # CREATE
  post("/insert_health_checkin", { :controller => "health_checkins", :action => "create" })
          
  # READ
  get("/health_checkins", { :controller => "health_checkins", :action => "index" })
  
  get("/health_checkins/:path_id", { :controller => "health_checkins", :action => "show" })
  
  # UPDATE
  
  post("/modify_health_checkin/:path_id", { :controller => "health_checkins", :action => "update" })
  
  # DELETE
  get("/delete_health_checkin/:path_id", { :controller => "health_checkins", :action => "destroy" })

  #------------------------------
  # Routes for Smart Health:

  # Smart Health page route
  # get("/smart_health", { :controller => "pages", :action => "smart_health" })

  
end
