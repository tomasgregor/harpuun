class ChangeQuarterInStarters < ActiveRecord::Migration
  def up
    change_column :starters, :quarter, :string
  end

  def down
    change_column :starters, :quarter, :integer
  end
end
