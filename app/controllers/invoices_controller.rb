class InvoicesController < ApplicationController

  def addCheck
    @addCheck = Invoice.find(params[:id])
    # @new_date = params[:paid_date[1i]].to_i+params[:paid_date[2i]].to_i+params[:paid_date[3i]].to_i
    if @addCheck.update(check_payment: params[:check_number], paid_date: params[:date])
      redirect_to '/companies'
    else
      flash[:errors] = @addCheck.errors.full_messages
      redirect_to :back
    end
  end

  def deleteInvoice
    Invoice.find(params[:id]).destroy
    redirect_to '/companies'
  end

  def show
    @invoice = Invoice.find(params[:id])
  end


  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:success] = "Your invoice has been created"
      redirect_to "/companies"
    else
      flash[:errors] = @invoice.errors.full_messages
      redirect_to :back
    end
  end

  def update
  	# the below updates invoice to be paid via updating stripe_payment(or check_payment) and paid_date
  	# Invoice.update(4, :stripe_payment=> "222sd2g34234",:paid_date => Time.now.to_s(:db))
  	@invoice = Invoice.find(params[:id])

  	if @invoice.update(invoice_params)
  		flash[:success] = "Your invoice has been updated"
  		# change the redirect_to to be after clients
  		redirect_to "/clients"
  	else
  		flash[:errors] = @invoice.errors.full_messages
  		redirect_to :back
  	end
  end		

  def destroy
    session.clear
    redirect_to :back
  end
  
  private
    def invoice_params
      params.require(:invoice).permit(:client_id, :company_id, :sendDate, :due_by, :description, :amount, :paid_date)
    end
end