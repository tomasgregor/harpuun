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
  
  def logged_in_already?
    if @client
      redirect_to client_url(@client), :notice => "You're already logged in."
      return
    elsif @starter
      redirect_to starter_url(@starter), :notice => "You're already logged in."
      return
    end
  end

  def require_admin
    if @starter.blank?
      redirect_to root_url, :notice => "Oops, it looks like you were shooting at the wrong whale!"
      return
    elsif
      @starter.admin != true
      redirect_to root_url, :notice => "Oops, it looks like you were shooting at the wrong whale!"
      return
    end
  end

end
