# require_relative '../policies/all'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= session[:user_id].try{|id| User.find(id)}
  end

  include Authorizable
end
