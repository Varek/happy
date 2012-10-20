class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :logged_out?

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    current_user.nil?
  end
end
