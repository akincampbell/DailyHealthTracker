class PagesController < ApplicationController
  def smart_health
    render(template: "pages/smart_health")
  end
end
