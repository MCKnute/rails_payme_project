class DashboardsController < ApplicationController
	def index
		@company = Company.find(session[:company_id])
		@clients = Client.where(company: Company.find(session[:company_id]))
		@unpaidvoices = Invoice.where(company: Company.find(session[:company_id]), paid_date: nil).order(:due_by)
		@paidvoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil).order(:paid_date)
	end
end
