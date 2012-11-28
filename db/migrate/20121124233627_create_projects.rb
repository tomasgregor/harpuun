class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :reward
      t.string :deadline
      t.integer :contractor_id
      t.integer :skill_id1
      t.integer :skill_id2
      t.integer :skill_id3

      t.timestamps
    end
  end
end
