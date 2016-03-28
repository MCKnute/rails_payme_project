class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :client, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.date :send
      t.date :due_by
      t.text :description
      t.float :amount
      t.string :stripe_payment
      t.integer :check_payment
      t.date :paid_date

      t.timestamps null: false
    end
  end
end
