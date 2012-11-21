class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :avatar_url
      t.string :password_digest

      t.timestamps
    end
  end
end
