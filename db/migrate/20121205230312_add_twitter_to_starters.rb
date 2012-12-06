class AddTwitterToStarters < ActiveRecord::Migration
  def change
    add_column :starters, :twitter, :string
  end
end
