module ApplicationHelper
  
  def contractor_logged_in?
     session[:contractor_id].present?
  end
  
  def starter_logged_in?
     session[:starter_id].present?
  end
  
end
