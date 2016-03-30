class DashboardsController < ApplicationController

	

	def index
		@clients = Client.where(company: Company.find(session[:company_id]))
		@unpaidvoices = Invoice.where(company: Company.find(session[:company_id]), paid_date: nil)
		@paidvoices = Invoice.where(company: Company.find(session[:company_id])).where.not(:paid_date => nil)
	end
end
