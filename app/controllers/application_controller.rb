class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    @current_user = User.find_by_session_token(session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
    redirect_to user_url(current_user)
  end

  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to homepage_index_url
  end
end
