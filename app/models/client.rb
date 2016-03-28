class Client < ActiveRecord::Base
  belongs_to :company
  has_secure_password
end
