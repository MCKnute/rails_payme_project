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
    @out = Invoice.where(client_id: @client.id, paid_date: nil).order(:due_by)
    @paid = Invoice.where(client_id: @client.id).where.not(paid_date: nil).order(:paid_date)
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "You have successfully registered a new client"
      redirect_to "/companies"
    else
      flash[:errors] = @client.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    if session[:client_id]
      @client = Client.find(session[:client_id])
    else 
      @client = Client.find(params[:id])
    end
  end
  
  def update
    client = Client.find(params[:client_id])
    if client.update(name: params[:name],
                      address_line1: params[:address_line1],
                      address_line2: params[:address_line2],
                      city: params[:city], 
                      state: params[:state],
                      zip: params[:zip], 
                      phone: params[:phone])
      if session[:client_id]
        redirect_to '/clients'
      else 
        redirect_to '/companies'
      end
    else
      flash[:errors] = client.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    client = Client.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def client_params
      params.require(:client).permit(:name, :address_line1, :address_line2, :city, :state, :zip, :phone, :email, :password, :company_id)
    end
end
