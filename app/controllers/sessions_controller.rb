class SessionsController < ApplicationController
  def index
  	
  end

  def new
  end

  def create
  	client = Client.find_by_email(params[:email])
    company = Company.find_by_email(params[:email])
    if company
      company.inspect
      if company && company.authenticate(params[:password])
        flash[:success] = "You are logged in as a company"
        session[:company_id] = company.id
        redirect_to "/companys/#{company.id}"
      else
        flash[:errors] = ["Invalid combination"]
        redirect_to "/"
      end
    elsif client
      client.inspect
      if client && client.authenticate(params[:password])
        flash[:success] = "You are logged in as a client"
        session[:client_id] = client.id
        redirect_to "/clients/#{client.id}"
      else
        flash[:errors] = ["Invalid combination"]
        redirect_to "/"
      end
    else
      flash[:errors] = ["You are not a registered member. Please register to gain access to the site"]
      redirect_to "/sessions"
    end
  end

  def destroy
  	if session[:company_id]
      session[:company_id] = nil
      session.clear
      redirect_to "/sessions"
    else
      session[:client_id] = nil
      session.clear
      redirect_to "/sessions"
    end
  end
end
