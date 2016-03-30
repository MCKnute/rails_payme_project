class CompaniesController < ApplicationController
  
  def index
  end

  def new
  end

  def edit
    @company = Company.find(session[:company_id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "You have successfully registered as a new Company"
      redirect_to "/register"
    else
      flash[:errors] = @company.errors.full_messages
      render :back
    end
  end

  def update
    company = Company.find(session[:company_id])
    if company.update(name: params[:name],
                      address_line1: params[:address_line1],
                      address_line2: params[:address_line2],
                      city: params[:city], 
                      state: params[:state],
                      zip: params[:zip], 
                      phone: params[:phone])
    redirect_to '/companies'
    else
      flash[:errors] = company.errors.full_messages
      redirect_to :back
    end
  end

  def show
  end

  def destroy
    session[:company_id] = nil
    session.clear
    redirect_to "/register"
  end

  private
    def company_params
      params.require(:company).permit(:name, :address_line1, :address_line2, :city, :state, :zip, :phone, :email, :password, :password_confirmation)
    end

end
