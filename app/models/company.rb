class Company < ActiveRecord::Base
  has_secure_password
  has_many :clients, dependent: :destroy
  has_many :client_invoices, through: :invoices, source: :client
end
