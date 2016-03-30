class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user
    if session[:company_id]
    	@current_user = Company.find(session[:company_id])
    elsif session[:client_id]
    	@current_user = Client.find(session[:client_id])
    end
  end

  helper_method :current_user

  def require_login
  	redirect_to "/sessions" if session[:company_id] || session[:client_id]
  end

  def require_current_user
  	if session[:company_id]
  		company = Company.find(session[:company_id])
  		redirect_to "/sessions" if current_user != company
  	else
  		client = Client.find(session[:client_id])
  		redirect_to "/sessions" if current_user != client
  	end	
  end
end
