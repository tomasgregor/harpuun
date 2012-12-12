class AddLocationAndPhoneToStarters < ActiveRecord::Migration
  def change
  	add_column :starters, :location, :string
  	add_column :starters, :phone, :integer
  end
end
