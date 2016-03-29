class ClientsController < ApplicationController
  def index
  end

  def new
  end

  def show
    if session[:client_id]
      @client = Client.find(session[:client_id])
    else 
      @client = Client.find(params[:id])
    end
    @out = Invoice.where(client_id: @client.id, paid_date: nil)
    @paid = Invoice.where(client_id: @client.id).where.not(paid_date: nil)
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "You have successfully registered as a client"
      redirect_to "/companies"
    else
      flash[:errors] = @client.errors.full_messages
      redirect_to :back
    end
  end

  def edit
  end
  
  def update
  end

  def destroy
    session[:client_id]
    session[:client_id] = nil
    session.clear
    redirect_to "/sessions"
  end

  private
    def client_params
      params.require(:client).permit(:name, :address_line1, :address_line2, :city, :state, :zip, :phone, :email, :password, :company_id)
    end
end
