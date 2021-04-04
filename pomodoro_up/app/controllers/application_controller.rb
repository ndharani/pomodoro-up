class ApplicationController < ActionController::Base
  # default throws exceptions. this line prevents exceptions from being thrown
  # TODO: is there a better workaround to this error
    # "HTTP Origin header (http://localhost) didn't match request.base_url (https://ndharani-pomodoro-up-ph5x-3000.githubpreview.dev)"
  protect_from_forgery
end
