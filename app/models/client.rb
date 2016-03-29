class Client < ActiveRecord::Base
  belongs_to :company
  has_many :invoices
  has_many :company, through: :invoices, source: :company
  has_secure_password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :address_line1, :city, :state, :zip, :phone, :company_id, :presence => true
  validates :email, :presence => true, :format => {:with => email_regex }, :uniqueness => { :case_sensitive => false }
end
