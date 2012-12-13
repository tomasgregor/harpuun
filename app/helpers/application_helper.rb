module ApplicationHelper

  def client_logged_in?
    session[:client_id].present?
  end
	
  def starter_logged_in?
    session[:starter_id].present?
  end
  
  def skill_name(skill_id)
    name = Skill.find_by_id(skill_id).name
  end
  
  def self.shorten(length)
    truncate(self, :length => length)
  end
  
end
