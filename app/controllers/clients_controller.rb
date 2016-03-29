class ClientsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @client = client.new(client_params)
    if @client.save
      flash[:success] = "You have successfully registered as a client"
      redirect_to "/sessions"
    else
      flash[:errors] = @client.errors.full_messages
      redirect_to :back
    end
  end

  def update
  end

  def show
  end

  def destroy
    session[:client_id]
    session[:client_id] = nil
    session.clear
    redirect_to "/sessions"
  end

  private
    def client_params
      params.require(:client).permit(:name, :address_line1, :address_line2, :city, :state, :zip, :phone, :email, :password: :company_id)
    end
end
