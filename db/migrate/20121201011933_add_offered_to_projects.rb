class AddOfferedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :offered_to, :integer
  end
end
