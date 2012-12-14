class AddColumnsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phone, :string
    add_column :clients, :location, :string
  end
end
