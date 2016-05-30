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
      flash[:danger] = t('error')
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    if @category.destroy
      flash[:success] = t('category_destroyed')
      redirect_to controller: 'admins', action: 'index'
    else
      flash[:danger] = t('error')
      redirect_to admin_path
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])

    if @category.update(category_params)
      flash[:success] = t('category_updated')
      redirect_to controller: 'admins', action: 'index'
    else
      flash[:danger] = t('error')
      redirect_to root_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
