class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
