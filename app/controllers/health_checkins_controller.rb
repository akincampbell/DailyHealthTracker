class HealthCheckinsController < ApplicationController
  def index
    matching_health_checkins = HealthCheckin.where({ :user_id => current_user })

    @list_of_health_checkins = matching_health_checkins.order({ :created_at => :desc })

    # Streak Count
    @streak_count = 0
    @list_of_health_checkins.each do |a_health_checkin|
      if (a_health_checkin.water && a_health_checkin.grain && a_health_checkin.protein && a_health_checkin.fruit && a_health_checkin.vegetable && a_health_checkin.exercise)
        @streak_count = @streak_count + 1     
      end
    end

    if user_signed_in?
      render({ :template => "health_checkins/index" })
    else
      render({ :template => "health_checkins/login" })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_health_checkins = HealthCheckin.where({ :id => the_id })

    @the_health_checkin = matching_health_checkins.at(0)

    render({ :template => "health_checkins/show" })
  end

  def checkin_page
    render({ :template => "health_checkins/_checkin" })
  end

  def create
    the_health_checkin = HealthCheckin.new
    the_health_checkin.water = params.fetch("query_water", false)
    the_health_checkin.grain = params.fetch("query_grain", false)
    the_health_checkin.protein = params.fetch("query_protein", false)
    the_health_checkin.fruit = params.fetch("query_fruit", false)
    the_health_checkin.vegetable = params.fetch("query_vegetable", false)
    the_health_checkin.user_id = current_user.id
    the_health_checkin.weight = params.fetch("query_weight", 0.00)
    the_health_checkin.exercise = params.fetch("query_exercise", false)
    the_health_checkin.journal = params.fetch("query_journal", false)

    if the_health_checkin.valid?
      the_health_checkin.save
      redirect_to("/health_checkins", { :notice => "Health checkin created successfully." })
    else
      redirect_to("/health_checkins", { :alert => the_health_checkin.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_health_checkin = HealthCheckin.where({ :id => the_id }).at(0)

    the_health_checkin.water = params.fetch("query_water", false)
    the_health_checkin.grain = params.fetch("query_grain", false)
    the_health_checkin.protein = params.fetch("query_protein", false)
    the_health_checkin.fruit = params.fetch("query_fruit", false)
    the_health_checkin.vegetable = params.fetch("query_vegetable", false)
    the_health_checkin.user_id = params.fetch("query_user_id")
    the_health_checkin.weight = params.fetch("query_weight")
    the_health_checkin.exercise = params.fetch("query_exercise", false)

    if the_health_checkin.valid?
      the_health_checkin.save
      redirect_to("/health_checkins/#{the_health_checkin.id}", { :notice => "Health checkin updated successfully."} )
    else
      redirect_to("/health_checkins/#{the_health_checkin.id}", { :alert => the_health_checkin.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_health_checkin = HealthCheckin.where({ :id => the_id }).at(0)

    the_health_checkin.destroy

    redirect_to("/health_checkins", { :notice => "Health checkin deleted successfully."} )
  end
end
