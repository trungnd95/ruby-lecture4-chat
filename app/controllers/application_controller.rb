class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
    session[:username]
  end

  def require_user!
    unless current_user
      flash[:info] = "Please login !"
      redirect_to  root_path
    end
  end
end
