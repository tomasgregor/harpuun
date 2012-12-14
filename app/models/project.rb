class Project < ActiveRecord::Base
  attr_accessible :client_id, :deadline, :description, :name, :reward, :skill_id1, :skill_id2, :skill_id3, :url, :completer_id, :actual_starter_id
  
  belongs_to :client
  belongs_to :actual_starter, :class_name => "Starter", :foreign_key => "actual_starter_id"
  belongs_to :completer, :class_name => "Starter", :foreign_key => "completer_id"
  has_many :offers
  
  validates :name, :length => { :in => 2..50 }
  validates :description, :length => { :in => 20..2000 }
  
  # validate :check_actual_starter,  :on => :update
  #              
  # def check_actual_starter
  #   if self.actual_starter_id != nil
  #     if self.changes[:actual_starter_id].blank? && self.changes[:actual_starter_id].first != nil 
  #       errors.add(:actual_starter_id, "Project has already been accepted by other Starter")
  #     end
  #   end
  # end
  
  private
  
  def self.actual
    Project.where("actual_starter_id IS NOT NULL")
  end
  
  def self.offered
    Project.where("actual_starter_id IS NULL and completer_id IS NULL")
  end
  
  def self.completed
    Project.where("completer_id IS NOT NULL")
  end
  
  def check_actual_starter_id
    if self.actual_starter_id != nil
      
    end
  end
  
end

