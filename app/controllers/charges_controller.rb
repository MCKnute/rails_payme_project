class ChargesController < ApplicationController
	def new
	@invoice = Invoice.find(params[:invoice_id])
	end

	def create
	  @invoice_amt = params[:invoice_amt]
	  @amount = params[:invoice_amt].to_i * 100

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	# Invoice.find(params[:invoice_id]).update(stripe_payment: params[:stripeToken], paid_date: Time.now.strftime("%Y-%m-%d"))

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
