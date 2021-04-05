class ApplicationController < ActionController::Base
  # default throws exceptions. this line prevents exceptions from being thrown
  # TODO: is there a better workaround to this error
    # "HTTP Origin header (http://localhost) didn't match request.base_url (https://ndharani-pomodoro-up-ph5x-3000.githubpreview.dev)"
  protect_from_forgery

  helper_method :errors, :current_user, :logged_in?

  def errors
    {}
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    if !logged_in?
      redirect_to login_path
    end
  end
end
