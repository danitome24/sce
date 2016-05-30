class PagesController < ApplicationController
  def home
    @categories = Category.all
    @products = Product.all
  end

  def static
    locale = I18n.locale
    page = params[:static]
    path = "layouts/legal_aspects/#{locale}/#{page}"
    respond_to do |format|
      format.html { render :template => path }
    end
  end
end
