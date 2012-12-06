class Starter < ActiveRecord::Base
  attr_accessible :avatar, :remote_avatar_url, :class_id1, :class_id2, :class_id3, :email, :first_name, :last_name, :password, :password_confirmation, :quarter, :skill_id1, :skill_id2, :skill_id3, :year, :twitter
  
  
  validates :first_name, :length => { :minimum => 2 }
  validates :last_name, :length => { :minimum => 2 }

  validates :email,
            :uniqueness => true,
            :email_format => true
  
  validates :password, :length => { :in => 6..20 }

  has_secure_password
  mount_uploader :avatar, ImageUploader
  
end
