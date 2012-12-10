class RenameColumnsInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :completed_by, :completer_id
    rename_column :projects, :accepted_by, :actual_starter_id
  end
end
