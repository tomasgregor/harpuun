class Offer < ActiveRecord::Base
  attr_accessible :offered_on, :project_id, :accepted_by
  
  belongs_to :project
  belongs_to :starter, :foreign_key => "accepted_by"
  
end
