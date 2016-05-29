class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  before_filter :categories, :client

  helper_method :current_order

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    {locale: I18n.locale}
  end

  def categories
    @categories = Category.all
  end

  def client
    if user_signed_in?
      @client = Client.find_by user_id: current_user.id
    end
  end

  def current_order
    if user_signed_in?
      @search = Order.find_by(client_id: current_user.id, order_status_id: 1)
      if @search.blank?
        Order.new(client_id: current_user.id)
      else
        @search
      end
    else
      Order.new
    end
  end
end
