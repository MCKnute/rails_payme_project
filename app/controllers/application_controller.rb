class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	Company.find(session[:company_id]) if session[:company_id]
  	Client.find(session[:client_id]) if session[:client_id]
  end

  helper_method :current_user

  def require_login
  	redirect_to "/sessions" if session[:company_id] || session[:client_id]
  end

  def require_corrent_user
  	if session[:company_id]
  		company = Company.find(session[:company_id])
  		redirect_to "/sessions" if current_user != company
  	else
  		client = Client.find(session[:client_id])
  		redirect_to "/sessions" if current_user != client
  	end	
  end
end
