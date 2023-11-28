class PagesController < ApplicationController
  def about
    render(template: "pages/about")
  end

  def smart_health
    render(template: "pages/smart_health")
  end
end
