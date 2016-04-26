class AdminsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products.with_translations(I18n.locale)
  end
end
