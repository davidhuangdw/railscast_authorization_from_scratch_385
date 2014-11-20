require_relative '../policies/all'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= session[:user_id].try{|id| User.find(id)}
  end


  helper_method :allow
  def policy_class(model=nil)
    model ||= params[:controller].singularize
    (model.to_s.camelize + 'Policy').constantize
  end
  def allow(record, query)
    policy_class(record.try(:class)).new(current_user,record).send(query)
  end
  def authorize(record, query=params[:action])
    redirect_to root_url, notice:'Not authorize' unless allow(record, query)
  end
  def authorize_action(query=params[:action], record=nil)
    authorize(record, query)
  end
end
