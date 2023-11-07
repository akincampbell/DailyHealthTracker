Rails.application.routes.draw do
  # Daily Health Tracks and root routes
  # root "tracks#index"
  get("/", { :controller => "tracks", :action => "index" })

  get("/tracks/new", { :controller => "tracks", :action => "new" })

  get("/tracks/index", { :controller => "tracks", :action => "index" })


  # About page route
  get("/about", { :controller => "pages", :action => "about" })

  # Smart Health page route
  get("/smart_health", { :controller => "pages", :action => "smart_health" })
end
