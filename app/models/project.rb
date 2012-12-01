class Project < ActiveRecord::Base
  attr_accessible :client_id, :deadline, :description, :name, :reward, :skill_id1, :skill_id2, :skill_id3, :url
  
  belongs_to :client
  has_many :offers
  
  before_save :offer_project_to_starter
  
  
  def offer_project_to_starter
    if !self.offered_to
      not_eligible_starters_ids = Project.select(:offered_to).map(&:offered_to)
      all_starters_ids = Starter.select(:id).map(&:id)
      eligible_starters_ids = all_starters_ids - not_eligible_starters_ids
      if eligible_starters_ids.any?
        offered_starter_id = eligible_starters_ids.shuffle[0]
        self.offered_to = offered_starter_id
      end
    end
  end
  
  # offer_project_to_starter
  # checks beofre every Project save action (create or update) whether offered_to is empty. if yes, tries to assign an eligible Starter Id
  # finds Starters without offered project
  # randomly picks 1 eligible Starter
  # assignes his Id to Project offered_to column
  
  
end
