class Product < ActiveRecord::Base
  translates :name, :description
  globalize_accessors :locales => I18n.available_locales, :attributes => [:name, :description]
  belongs_to :category
end
