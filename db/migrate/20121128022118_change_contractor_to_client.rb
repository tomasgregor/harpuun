class ChangeContractorToClient < ActiveRecord::Migration
  def change
    rename_table :contractors, :clients
  end
end
