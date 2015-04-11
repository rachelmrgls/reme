class PasswordResetsController < ApplicationController
  before_action :get_client,   only: [:edit, :update]
  before_action :valid_client, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end

  def create
    @client = Client.find_by(email: params[:password_reset][:email].downcase)
    if @client
      @client.create_reset_digest
      @client.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @client.update_attributes(client_params)
      log_in @client
      flash[:success] = "Password has been reset."
      redirect_to @client
    else
      render 'edit'
    end
  end

  def edit
  end


  private
  	def client_params
      params.require(:client).permit(:password, :password_confirmation)
    end

    # Returns true if password is blank.
    def password_blank?
      params[:client][:password].blank?
    end

    def get_client
      @client = Client.find_by(email: params[:email])
    end

    # Confirms a valid client.
    def valid_client
      unless (@client && @client.activated? &&
              @client.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @client.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
