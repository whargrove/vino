class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if current_user.nil?
      redirect_to login_url, alert: 'Not authorized'
    end
  end
  
  def authorize_registration
    unless Rails.env.production?
      return true
    end

    # Is the request IP whitelisted?
    if request.remote_ip == Rails.application.secrets.ip_address
      return true 
    else
      redirect_to root_url, alert: 'Not authorized'
    end
  end
end
