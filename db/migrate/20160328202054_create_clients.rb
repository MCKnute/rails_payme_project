class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :email
      t.string :password_digest
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
