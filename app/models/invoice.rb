class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :company

  validate :date_present_only
  validates :date, :presence => true

  def date_present_only
  	if date.present? && date < Date.today
  	   errors.add(:date, "Your date can't be in the past")
  	end
  end
end
