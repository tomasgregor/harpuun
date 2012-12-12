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
  
  def require_admin
    if current_starter.blank?
      redirect_to root_url, :notice => "Oops, it looks like you were shooting at the wrong whale!"
      return
    elsif
      current_starter.admin != true
      redirect_to root_url, :notice => "Oops, it looks like you were shooting at the wrong whale!"
      return
    end
  end
  
  def logged_in_already?
    if current_client
      redirect_to client_url(current_client), :notice => "You're already logged in."
      return
    elsif current_starter
      redirect_to starter_url(current_starter), :notice => "You're already logged in."
      return
    end
  end

end
