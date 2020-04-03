class Item < ApplicationRecord

  #active_hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :area

  #Association
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :comments
  has_many :pictures

  #validation
  validates :price,:size,:category,:status,:delivery_charge,:area,:shipping_date,:shipping_method, presence: true
  validates :item_name, presence: true, length: {maximum: 40}
  validates :discription, presence: true, length: {maximum: 1000}

  accepts_nested_attributes_for :pictures, allow_destroy: true

end
