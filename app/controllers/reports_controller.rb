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

  def year
    if params[:id] == nil
      params[:id] = Date.today.year.to_s
    end
    @startdate = params[:id]+"-01-01"
    @enddate = params[:id]+"-12-31"

    if session[:company_id]
      @invoices = Invoice.where(company_id: session[:company_id]).where('paid_date BETWEEN ? AND ?', @startdate.to_date, @enddate.to_date) 
      @wording = "Earnings"
    elsif session[:client_id]
      @invoices = Invoice.where(client_id: session[:client_id]).where('paid_date BETWEEN ? AND ?', @startdate.to_date, @enddate.to_date)
      @wording = "Payments"
    end 
    @total = @invoices.sum(:amount)
  end


  def quarter
    if params[:id2].to_s === "1"
      @startdate = params[:id]+"-01-01"
      @enddate = params[:id]+"-03-31"
    elsif params[:id2].to_s === "2"
      @startdate = params[:id]+"-04-01"
      @enddate = params[:id]+"-06-30"
    elsif params[:id2].to_s === "3"
      @startdate = params[:id]+"-07-01"
      @enddate = params[:id]+"-09-30"
    elsif params[:id2].to_s === "4"
      @startdate = params[:id]+"-10-01"
      @enddate = params[:id]+"-12-31"
    else
      flash[:errors] = ["You can only view quarters numbered between 1 and 4. Redirecting to Quarter 1."]
      @startdate = params[:id]+"-01-01"
      @enddate = params[:id]+"-03-31"
      params[:id2] = "1"
    end

    if session[:company_id]
      @invoices = Invoice.where(company_id: session[:company_id]).where('paid_date BETWEEN ? AND ?', @startdate.to_date, @enddate.to_date).order(:paid_date) 
      @wording = "Earnings"
    elsif session[:client_id]
      @invoices = Invoice.where(client_id: session[:client_id]).where('paid_date BETWEEN ? AND ?', @startdate.to_date, @enddate.to_date).order(:paid_date) 
      @wording = "Payments"
    end

    @total = @invoices.sum(:amount)
  end

end
