class DashboardsController < ApplicationController

	def index
		@clients = Client.where(company: Company.find(1))
		@unpaidvoices = Invoice.where(company: Company.find(1), paid_date: nil)
		@paidvoices = Invoice.where(company: Company.find(1)).where.not(paid_date: nil)
	end
end
