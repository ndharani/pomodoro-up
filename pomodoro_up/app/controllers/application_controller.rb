class ApplicationController < ActionController::Base
  helper_method :errors, :current_user, :logged_in?, :authorize

  def errors
    {}
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize
    if !logged_in?
      redirect_to users_path
    end
  end
end
