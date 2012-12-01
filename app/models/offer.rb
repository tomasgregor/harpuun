class Offer < ActiveRecord::Base
  attr_accessible :offered_on, :project_id, :starter_id
  
  belongs_to :project
  
end
