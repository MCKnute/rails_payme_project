class RenameSendColumnToSendDateInInvoices < ActiveRecord::Migration
  def change
  	rename_column :invoices, :send, :sendDate
  end
end
