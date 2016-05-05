class Product < ActiveRecord::Base
  has_many :order_items

  default_scope { where(active: true) }
  translates :name, :description
  globalize_accessors :locales => I18n.available_locales, :attributes => [:name, :description]
  belongs_to :category
  mount_uploader :image, ImageUploader
end
