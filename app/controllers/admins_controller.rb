class AdminsController < ApplicationController
  def index
    @categories = Category.all
  end
end
