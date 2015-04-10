class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def new
  	@client = Client.new
  end

  def create
    @client = Client.new(client_params)    # Not the final implementation!
    if @client.save
    	log_in @client
    	flash[:success] = "You have succesfully created an account!"
      redirect_to @client
    else
      render 'new'
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
