class Client < ActiveRecord::Base
  belongs_to :company
  has_many :invoices
  has_many :company, through: :invoices, source: :company
  has_secure_password
end
