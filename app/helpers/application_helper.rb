module ApplicationHelper

  def client_logged_in?
    session[:client_id].present?
  end
	
  def starter_logged_in?
    session[:starter_id].present?
  end
  
end
