class ChangePhoneType3 < ActiveRecord::Migration
  def change
  	change_column :companies, :phone, :string
  end
end
