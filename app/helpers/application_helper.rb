module ApplicationHelper
  
  def contractor_logged_in?
     session[:contractor_id].present?
  end
  
end
