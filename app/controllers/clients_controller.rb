class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      redirect_to clients_path
    end
  end

  private
  def client_params
    params.require(:client).permit(:firstname, :lastname, :phone, :address, :city, :postalcode, :ccnumber, :user_id)
  end

end
