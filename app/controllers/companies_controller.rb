class CompaniesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "You have successfully registered as a Company"
      redirect_to "/register"
    else
      flash[:errors] = @company.errors.full_messages
      redirect_to :back
    end
  end

  def update
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
