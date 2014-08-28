class SessionsController < ApplicationController
  before_filter RubyCAS::Filter, :except => :logout
  
  def new
    path = params[:source] || root_path
    redirect_to path
  end

  def destroy
    RubyCAS::Filter.logout(self)
  end
end
