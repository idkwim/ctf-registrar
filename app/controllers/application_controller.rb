class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_team

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
