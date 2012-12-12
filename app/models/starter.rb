class Starter < ActiveRecord::Base
  attr_accessible :avatar, :remote_avatar_url, :class_id1, :class_id2, :class_id3, :email, :first_name, :last_name, :password, :password_confirmation, :quarter, :skill_id1, :skill_id2, :skill_id3, :year, :twitter
  
  has_one :actual_project, :class_name => "Project", :foreign_key => "actual_starter_id"
  has_many :completed_projects, :class_name => "Project", :foreign_key => "completer_id"
  has_many :accepted_offers, :class_name => "Offer", :foreign_key => "accepted_by"
  has_many :accepted_projects, :through => :accepted_offers, :source => :project
  
  validates :first_name, :length => { :minimum => 2 }
  validates :last_name, :length => { :minimum => 2 }

  validates :email,
            :uniqueness => true,
            :email_format => true
  
  # Validation below makes app require password on profile update. We can delete it or figure out how to do it some other way
  # validates :password, :length => { :in => 6..20 }

  has_secure_password
  mount_uploader :avatar, ImageUploader
  
  after_create :starter_confirm_email
  
  def starter_confirm_email
    SignUpMailer.starter_confirm(self).deliver
  end
  
end
