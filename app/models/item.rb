class Item < ApplicationRecord
  #active_hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status,:delivery_charge,:shipping_date,:shipping_method

  #Association
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :pictures

  #validation
  validates :item_name,:price,:discription,:size,:category,:status,:delivery_charge,:area,:shipping_date,:shipping_method, presence: true

  accepts_nested_attributes_for :pictures, allow_destroy: true

end
