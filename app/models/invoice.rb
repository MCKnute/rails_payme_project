class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :company

  validates :client_id, :company_id, :description, :sendDate, :due_by, :amount, :presence => true
  validate :date_present_only
  validate :date_validation

  def date_present_only
  	if due_by.present? && due_by < Date.today 
       errors.add(:due_by, "Your date can't be in the past nor be before the Send Date")
    end
    if sendDate.present? && sendDate < Date.today 
  	   errors.add(:sendDate, "Your date can't be in the past")
  	end
  end

  def date_validation
    if self[:due_by] < self[:sendDate]
      errors.add(:due_by,"Your 'Send Date' can't be later than your 'Due By' Date")
      return false
    else
      return true
    end
  end
end