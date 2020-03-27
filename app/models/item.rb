class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  #Association
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :pictures

  #validation
  validates :item_name,:price,:description,:category,:status,:delevery_charge,:area,:shipping_date,:shipping_method
end
