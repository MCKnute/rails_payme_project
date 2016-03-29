class ChangePhonetoStringClientsModel < ActiveRecord::Migration
  def change
  	change_column :clients, :phone, :string
  end
end
