class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.with_translations(I18n.locale)
  end

  def show
    category = Category.find_by(id: params[:category_id])
    @product = category.products.with_translations(I18n.locale).find_by(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Correcto'
    else
      flash[:alert] = t('error')
    end
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name_es, :name_en, :description_en, :description_es, :category_id, :price)
  end

end
