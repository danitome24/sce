class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.with_translations(I18n.locale)
  end

  def show
    @categories = Category.all
    @category = Category.find_by params[:id]
  end
end
