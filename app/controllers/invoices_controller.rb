class InvoicesController < ApplicationController
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
