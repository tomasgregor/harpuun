class Contractor < ActiveRecord::Base
  attr_accessible :avatar_url, :remote_avatar_url_url, :company, :email, :first_name, :last_name, :password, :password_confirmation
  
  has_secure_password
  
  validates_uniqueness_of :email
  
  mount_uploader :avatar_url, ImageUploader
  
end
