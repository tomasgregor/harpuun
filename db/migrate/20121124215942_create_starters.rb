class CreateStarters < ActiveRecord::Migration
  def change
    create_table :starters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.integer :skill_id1
      t.integer :skill_id2
      t.integer :skill_id3
      t.integer :year
      t.integer :quarter
      t.integer :class_id1
      t.integer :class_id2
      t.integer :class_id3

      t.timestamps
    end
  end
end
