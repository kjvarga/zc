class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated?, :require_admin

  def authenticated?
    return @authenticated unless @authenticated.nil?
    @authenticated = Session.where(:session_id => session[:session_id]).where('created_at >= ?', 30.days.ago).count > 0
  end

  def require_admin
    redirect_to login_url(:action => :login) unless authenticated?
  end
end
