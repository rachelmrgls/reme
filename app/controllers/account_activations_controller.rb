class AccountActivationsController < ApplicationController
  def edit
    client = Client.find_by(email: params[:email])
    if client && !client.activated? && client.authenticated?(:activation, params[:id])
      client.activate
      log_in client
      flash[:success] = "Account activated!"
      redirect_to client
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
