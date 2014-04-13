class Jarmandy::TeamsController < Jarmandy::BaseController
  def index
    if !params[:q].blank?
      @source = 'Search results'
      @teams = Team.search(params[:q]).order(created_at: :desc)
    else
      @source = 'New teams'
      @teams = Team.order(created_at: :desc)
    end
  end

  def show
    @team = Team.find params[:id]
  end
end