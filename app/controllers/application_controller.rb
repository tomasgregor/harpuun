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
  
  def require_admin
    if current_starter.blank?
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    elsif
      current_starter.admin != true
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    end
  end

end
