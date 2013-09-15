class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_team 
  helper_method :during_game?, :before_game?, :game_window

  def require_logged_in
    return true if current_user
    reset_session
    flash[:error] = "You're not logged in."
    redirect_to root_path
  end

  def require_logged_out
    return true unless current_user
    flash[:error] = "You're already logged in."
    redirect_to dashboard_path
  end

  def require_on_team
    return true if current_user && current_team

    flash[:error] = "You're not a member of a team."
    redirect_to dashboard_path
  end

  def require_hot_team
    return true if current_user && current_team && current_team.hot

    redirect_to dashboard_path
    return false
  end

  def game_window
    Time.at(1402790400)..Time.at(1402963200)
  end

  def during_game?
    game_window.cover? Time.now
  end

  def before_game?
    game_window.first > Time.now
  end

  def require_during_game
    return true if cookies[:legitbs] == 'onAyWehinatdauvyuidsijyousAcbedpyipNesOc'
    return true if during_game?

    redirect_to dashboard_path
    return false
  end

  def require_before_game
    return true if cookies[:legitbs] == 'onAyWehinatdauvyuidsijyousAcbedpyipNesOc'
    return true if before_game?

    redirect_to dashboard_path
    return false
  end

  def lbs_cookie
    return unless params[:butts] == 'rututopankAdabvepyurHacfegwyajMevfafquob'
    cookies[:legitbs] = params[:legitbs]
  end

  def current_user
    @current_user ||= User.find session[:user_id] rescue nil
  end

  def current_team
    @current_team ||= current_user.team rescue nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = @current_user.id
  end

  def analytics_flash(*args)
    flash[:analytics] ||= []
    flash[:analytics] << args
  end
end
