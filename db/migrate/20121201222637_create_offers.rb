class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :project_id
      t.integer :starter_id
      t.date :offered_on

      t.timestamps
    end
  end
end
