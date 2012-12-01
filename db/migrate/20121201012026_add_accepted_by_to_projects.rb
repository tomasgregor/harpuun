class AddAcceptedByToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :accepted_by, :integer
  end
end
