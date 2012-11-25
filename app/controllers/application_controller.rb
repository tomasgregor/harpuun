class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_contractor

  def current_contractor
    @contractor ||= Contractor.find_by_id(session[:contractor_id])
  end
  
end
