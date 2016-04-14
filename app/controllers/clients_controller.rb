class ClientsController < ApplicationController

  $actions_profile = %w(profile password account)

  def new
    @client = Client.new
  end

  def show
    @client = Client.find_by user_id: current_user.id
    @actions = $actions_profile
    @selected = (params.has_key?(:a)) ? params[:a] : $actions_profile[0]
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      redirect_to clients_path
    end
  end


  def edit
    @client = Client.find_by user_id: current_user.id
    @actions = $actions_profile
    @selected = (params.has_key?(:a)) ? params[:a] : $actions_profile[0]
    @user = current_user

    render 'clients/edit/'+@selected
  end

  def update_password
    @user = User.find_by id: current_user.id
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      flash[:success] = t('password_updated')
      redirect_to root_path
    else
      flash[:error] = t('error')
      redirect_to root_path
    end
  end


  def update
    @selected = (params.has_key?(:a)) ? params[:a] : $actions_profile[0]
    @params = 'client_' + @selected + '_params'
    @client = Client.find_by user_id: current_user.id

    if @client.update(client_params)
      redirect_to root_path
      flash[:success] = t('profile_update_correct')
    else
      render 'clients/edit/profile'
    end
  end

  private
  def client_params
    params.require(:client).permit(:firstname, :lastname, :phone, :address, :city, :postalcode, :ccnumber, :user_id)
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
