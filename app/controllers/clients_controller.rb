class ClientsController < ApplicationController
	before_action :logged_in_client, only: [:index, :edit, :update, :destroy]
	before_action :correct_client,   only: [:edit, :update]
	before_action :admin_client,     only: :destroy

  def index
  	@clients = Client.paginate(page: params[:page])
  end

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

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Profile updated"
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    Client.find(params[:id]).destroy
    flash[:success] = "Client deleted"
    redirect_to clients_url
  end

  private

    def client_params
      params.require(:client).permit(:name, :email, :password,
                                   :password_confirmation)
    end


        # Confirms a logged-in user.
    def logged_in_client
      unless logged_in?
      	store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_client
      @client = Client.find(params[:id])
      redirect_to(root_url) unless current_client?(@client)
    end

    # Confirms an admin user.
    def admin_client
      redirect_to(root_url) unless current_client.admin?
    end

end
