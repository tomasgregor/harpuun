class ChangePhoneInStarters < ActiveRecord::Migration
  def up
    change_column :starters, :phone, :string
  end

  def down
  end
end
