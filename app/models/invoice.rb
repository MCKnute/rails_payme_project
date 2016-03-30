class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :company

  validates :client_id, :company_id, :description, :amount, :presence => true
  validates :sendDate, :due_by, :presence => true
  validate :date_present_only

  def date_present_only
  	if sendDate.present? && sendDate < Date.today 
  	   	errors.add(:sendDate, "Your date can't be in the past")
  	elsif due_by.present? && due_by > sendDate
  		errors.add(:due_by, "Your date can't be in the past nor be before the Send Date")
  	else
  		
  	end
  end
end
