module Authorizable
  extend ActiveSupport::Concern

  included{ helper_method :allow }
  def allow(record, query)
    policy(record).send(query)
  end
  def authorize(record, query=params[:action])
    redirect_to root_url, notice:'Not authorize' unless allow(record, query)
  end
  def authorize_action(query=params[:action], record=nil)
    authorize(record, query)
  end

  private
  def policy_class(model=nil)
    model ||= params[:controller].singularize
    (model.to_s.camelize + 'Policy').constantize
  end

  def policy(record)
    @policies ||= {}
    @policies[record] ||= policy_class(record.try(:class)).new(current_user,record)
  end
end