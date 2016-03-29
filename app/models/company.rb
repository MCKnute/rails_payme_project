class Company < ActiveRecord::Base
  has_secure_password

  has_many :clients
  has_many :invoices
end
