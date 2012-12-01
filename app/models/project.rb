class Project < ActiveRecord::Base
  attr_accessible :client_id, :deadline, :description, :name, :reward, :skill_id1, :skill_id2, :skill_id3, :url
  
  belongs_to :client
  
  before_save :offer_project_to_starter
  
  def offer_project_to_starter
    not_eligible_starters_ids = Project.select(:offered_to).map(&:offered_to)
    all_starters_ids = Starter.select(:id).map(&:id)
    eligible_starters_ids = all_starters_ids - not_eligible_starters_ids
    offered_starter_id = eligible_starters_ids.shuffle[0]
    self.offered_to = offered_starter_id
  end
  
end
