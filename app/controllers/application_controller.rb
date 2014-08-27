class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.new({:email => current_user_username})
  end
  helper_method :current_user

  def require_login
    redirect_to login_path(:source => request.original_fullpath) if current_user.nil?
  end

  private

  def current_user_username
    cas_username
  end

  def cas_username
    session[RubyCAS::Filter.client.username_session_key]
  end
end
