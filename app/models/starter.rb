class Starter < ActiveRecord::Base
  attr_accessible :avatar, :remote_avatar_url, :class_id1, :class_id2, :class_id3, :email, :first_name, :last_name, :password, :password_confirmation, :quarter, :skill_id1, :skill_id2, :skill_id3, :year
  
  has_many :projects
  has_many :skills
  
  has_secure_password
  
  validates_uniqueness_of :email
  
  mount_uploader :avatar, ImageUploader
  
end
