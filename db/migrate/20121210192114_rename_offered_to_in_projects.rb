class RenameOfferedToInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :offered_to, :completed_by
  end
end
