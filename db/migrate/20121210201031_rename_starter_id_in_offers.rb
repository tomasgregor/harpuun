class RenameStarterIdInOffers < ActiveRecord::Migration
  def change
    rename_column :offers, :starter_id, :accepted_by
  end
end
