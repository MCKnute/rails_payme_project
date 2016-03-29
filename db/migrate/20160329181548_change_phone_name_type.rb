class ChangePhoneNameType < ActiveRecord::Migration
  def change
  	rename_column :companies, :bigint, :phone 
  	change_column :companies, :phone, :bigint
  end
end
