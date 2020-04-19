class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  #Association
  belongs_to :item
end
