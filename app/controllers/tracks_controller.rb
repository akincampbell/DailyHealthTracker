class TracksController < ApplicationController
  def index
    render(template: "tracks/index")
  end

  def new
    render(template: "tracks/new")
  end
end
