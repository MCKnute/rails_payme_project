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
    @company = Company.find(session[:company_id])
    # paid invoices
    @invoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
    @total = @invoices.sum(:amount)
  	@total1 = @invoices.sum(:amount, :conditions => {:paid_date => [2016-01-01,2016-03-31]})
  end

  def twoq
    @company = Company.find(session[:company_id])
    # paid invoices
    @invoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
    @total = @invoices.sum(:amount)
  	@total2 = @invoices.sum(:amount, :conditions => {:paid_date => [2016-04-01,2016-06-30]})
    # @test = @invoices.where( :paid_date => [2016-04-01,2016-06-30] ).sum(:amount)

  end

  def threeq
    @company = Company.find(session[:company_id])
    # paid invoices
    @invoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
    @total = @invoices.sum(:amount)
  	@total3 = @invoices.sum(:amount, :conditions => {:paid_date => [2016-07-01,2016-9-30]})
  end

  def fourq
    @company = Company.find(session[:company_id])
    # paid invoices
    @invoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
    @total = @invoices.sum(:amount)
  	@total4 = @invoices.sum(:amount, :conditions => {:paid_date => [2016-10-01,2016-12-31]})
  end

  def show
  end
end
