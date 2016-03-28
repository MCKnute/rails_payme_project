class Company < ActiveRecord::Base
  has_secure_password

  has_many :clients

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :address_line1, :city, :state, :zip, :phone, :presence => true
  validates :email, :presence => true, :format => {:with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true
end
