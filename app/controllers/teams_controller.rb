class TeamsController < ApplicationController
  before_filter :require_logged_in
  before_filter :require_team, except: [:new, :create]
  before_filter :require_before_or_during_game

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = current_user.build_owned_team(team_params)

    @team.transaction do
      @team.save!
      current_user.team_id = @team.id
      current_user.save!      
    end

    if @team.persisted?
      # email them or don't
      TeamMailer.new_team_email(@team).deliver rescue nil

      cheevo('syn')

      analytics_flash '_trackEvent', 'Teams', 'create'
      redirect_to dashboard_path
    else
      render action: "new"
    end
  end

  private
  def team
    current_user.owned_team
  end

  def require_team
    return true if team
    flash[:error] = "You don't own a team."
    redirect_to dashboard_path
  end

  def team_params
    params.require(:team).permit(:name, :password, :password_confirmation, :fun)
  end
end
