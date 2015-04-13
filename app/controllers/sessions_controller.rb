class SessionsController < ApplicationController
  def new
  end

  def create
    client = Client.find_by(email: params[:session][:email].downcase)
    if client && client.authenticate(params[:session][:password])
      log_in client
      redirect_back_or client
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
