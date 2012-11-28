class RenameContractorIdInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :contractor_id, :client_id
  end
end
