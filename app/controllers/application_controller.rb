class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= cas_username
  end
  helper_method :current_user

  private

  def cas_username
    session[RubyCAS::Filter.client.username_session_key]
  end
end
