class PagesController < ApplicationController
  def about
    render(template: "pages/about")
  end

  def smart_health
    render(template: "pages/smart_health")
  end


  class PagesController < ApplicationController
    def landing_page
      if user_signed_in?
        # Redirect signed-in users to another page
        render(template: "health_checkins/index")
      else
        # Render landing page view for users not signed in
        render 'landing_page'
      end
    end
  end
end
