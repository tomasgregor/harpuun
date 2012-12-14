class Offer < ActiveRecord::Base
  attr_accessible :offered_on, :project_id, :accepted_by
  
  belongs_to :project
  belongs_to :starter, :foreign_key => "accepted_by"
    
  after_create :project_accepted_email
  
  def project_accepted_email
    SignUpMailer.project_accepted(self).deliver
  end
  
end
