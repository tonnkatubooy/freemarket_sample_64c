class Item < ApplicationRecord

  #Association
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :pictures

  #validation
  validates :item_name,:price,:description,:category,:status,:delevery_charge,:area,:shipping_date,:shipping_method, presence: true

  accepts_nested_attributes_for :pictures, allow_destroy: true
end
