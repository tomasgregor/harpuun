class Contractor < ActiveRecord::Base
  attr_accessible :avatar_url, :company, :email, :first_name, :last_name, :password, :password_confirmation
  
  has_secure_password
  
end
