class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_username

  def current_username
    session[:username]
  end
end
