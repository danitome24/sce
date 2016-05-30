class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.with_translations(I18n.locale)
  end

  def show
    category = Category.find_by(id: params[:category_id])
    @product = category.products.with_translations(I18n.locale).find_by(id: params[:id])
    @order_item = current_order.order_items.new
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      flash[:success] = t('product_updated')
      redirect_to admin_path(id: params[:category_id])
    else
      flash[:danger] = t('error')
      redirect_to root_path
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if product.destroy
      flash[:success] = t('product_destroyed')
      redirect_to controller: 'admins', id: params[:category_id]
    else
      flash[:danger] = t('error')
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = t('product_created')
      redirect_to admin_path(id: product_params[:category_id])
    else
      flash[:danger] = t('error')
      redirect_to root_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:name_es, :name_en, :description_en, :description_es, :category_id, :price, :image)
  end

end
