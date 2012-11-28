class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_client

  def current_client
    @client ||= Client.find_by_id(session[:client_id])
  end
  
  before_filter :current_client

  def current_starter
    @starter ||= Starter.find_by_id(session[:starter_id])
  end  
  
end
