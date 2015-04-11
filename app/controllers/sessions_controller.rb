class SessionsController < ApplicationController
  def new
  end

  def create
    client = Client.find_by(email: params[:session][:email].downcase)
    if client && client.authenticate(params[:session][:password])
      if client.activated?
        log_in client
        redirect_back_or client
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
