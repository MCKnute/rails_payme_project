class ClientsController < ApplicationController
  def index
  end

  def create
    company = session[:user_id]
    client = Client.new(name: client_params[:name], address_line1: client_params[:address_line1], address_line2: client_params[:address_line2], city: client_params[:city],
    		 state: client_params[:state], zip: client_params[:zip], phone: client_params[:phone], email: client_params[:email], password: client_params[:password], 
    		 company_id: 1)
    if client.save 
        redirect_to '/clients/new'
    else 
    	flash[:errors] = client.errors.full_messages
        redirect_to '/clients/new'
    end	
  end

  def show
  	@client = Client.find(2)
  	@out = Invoice.where(client_id: 2, paid_date: nil)
  	@paid = Invoice.where(client_id: 2) .where.not(paid_date: nil)
  end

  def edit
  end

  def update
  end

private
    def client_params
      params.require(:client).permit(:name, :address_line1, :address_line2, :city, :state, :zip, :phone, :email, :password, :password_confirmation)
    end 
end
