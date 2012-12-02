class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_client
  before_filter :current_starter

  def current_client
    @client ||= Client.find_by_id(session[:client_id])
  end

  def current_starter
    @starter ||= Starter.find_by_id(session[:starter_id])
  end
  
  def offered_project
    @offered_project ||= Project.find_by_offered_to(current_starter.id)
  end

end
