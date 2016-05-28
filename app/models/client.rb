class Client < ActiveRecord::Base
  belongs_to :user
  has_many :order
  mount_uploader :image, ImageUploader
end
