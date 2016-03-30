class ReportsController < ApplicationController
  def index
	@company = Company.find(session[:company_id])
  	# paid invoices
  	@invoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
  	@total = @invoices.sum(:amount)

  end

  def all
  	@total = @invoices.sum(:amount)
  end

  def oneq
  	@total = @invoices.sum(:amount, :conditions => {:paid_date => [2016-01-01,2016-03-31]})
  end

  def twoq
  	@total = @invoices.sum(:amount, :conditions => {:paid_date => [2016-01-01,2016-03-31]})
  end

  def threeq
  	@total = @invoices.sum(:amount, :conditions => {:paid_date => [2016-01-01,2016-03-31]})
  end

  def fourq
  	@total = @invoices.sum(:amount, :conditions => {:paid_date => [2016-01-01,2016-03-31]})
  end

  def show
  end
end
