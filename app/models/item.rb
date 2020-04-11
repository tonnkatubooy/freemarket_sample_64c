class Item < ApplicationRecord

  #active_hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_date
  #belongs_to_active_hash :shipping_method
  belongs_to_active_hash :area


  #Association
  belongs_to :user
  # belongs_to :brand
  # belongs_to :category
  has_many :comments
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true

  #validation
  validates :price,:status,:delivery_charge_id,:area_id,:shipping_date_id, presence: true
  # validates :category,:shipping_method_id,:size 一時的に外す
  validates :item_name, presence: true, length: {maximum: 40}
  validates :discription, presence: true, length: {maximum: 1000}

  accepts_nested_attributes_for :pictures, allow_destroy: true

end
