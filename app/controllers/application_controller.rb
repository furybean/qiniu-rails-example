class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  protected
  def authorize
  	redirect_to "/users/login" unless session[:user]
  end
end
