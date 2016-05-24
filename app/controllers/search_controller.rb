class SearchController < ApplicationController
  def index
    search_name = params[:search]
    @products = Product.search(search_name)
  end
end
