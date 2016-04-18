class Product < ActiveRecord::Base
  translates :name, :description
  belongs_to :category
end
