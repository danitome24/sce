class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find_by(params[:id])
  end
end
