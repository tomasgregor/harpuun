class AddAdminToStarter < ActiveRecord::Migration
  def change
    add_column :starters, :admin, :boolean, :default => false
  end
end
