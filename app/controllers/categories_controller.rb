class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find_by(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t('category_created')
      redirect_to root_path
    else
      flash[:alert] = t('error')
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
