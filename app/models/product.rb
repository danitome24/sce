class Product < ActiveRecord::Base
  has_many :order_items, dependent: :destroy

  default_scope { where(active: true) }
  translates :name, :description
  globalize_accessors :locales => I18n.available_locales, :attributes => [:name, :description]
  belongs_to :category
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      with_translations(I18n.locale).where('name LIKE ?', "%#{search}%")
    else
      return false
    end
  end


end
