class ChangePhoneType < ActiveRecord::Migration
  def change
  	change_column :companies, :phone, :bigint
  end
end
