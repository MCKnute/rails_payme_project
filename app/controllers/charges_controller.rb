class ChargesController < ApplicationController
	def new
		@invoice = Invoice.find(params[:invoice_id])
	end

	def create
	  Stripe.api_key = "sk_test_jKDPCGRhB53sQ2dYEa2N3iuB"
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
		@invoice = Invoice.find(params[:invoice_id])
		if @invoice.update(stripe_payment: params[:stripeToken], paid_date: Time.now.strftime("%Y-%m-%d"))
        	flash[:success] = "You have successfully paid this invoice!"
        else 
      		flash[:errors] = @invoice.errors.full_messages
      		redirect_to :back
      	end
		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
		end
end
