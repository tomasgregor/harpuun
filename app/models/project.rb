class Project < ActiveRecord::Base
  attr_accessible :client_id, :deadline, :description, :name, :reward, :skill_id1, :skill_id2, :skill_id3, :url, :offered_to, :accepted_by
  
  belongs_to :client
  has_many :offers
  
  after_save :offer_project_to_starter, :add_offer_to_history_list
  
  
  def available_for_offer?
    self.accepted_by.blank? && self.offered_to.blank?
  end
  
  def offered_starters
    offers.pluck(:starter_id)
  end

  def self.starters_with_offers
    Project.pluck(:offered_to)
  end
  
  def eligible_starters_for_offer
    not_eligible_starters_ids = offered_starters + Project.starters_with_offers
    all_starters_ids = Starter.pluck(:id)
    all_starters_ids - not_eligible_starters_ids
  end


  private
  
  def offer_project_to_starter
    if available_for_offer? && eligible_starters_for_offer.any?
      offered_starter_id = eligible_starters_for_offer.shuffle[0]
      self.update_attributes(:offered_to => offered_starter_id)
    end
  end
  
  
  def add_offer_to_history_list
    if self.offered_to.present?
      offer = Offer.where(:project_id => self.id).find_by_starter_id(self.offered_to)
      if offer.blank?
        today = Date.today
        self.offers.create(:starter_id => self.offered_to, :offered_on => today)
      end
    end
  end
   
end
