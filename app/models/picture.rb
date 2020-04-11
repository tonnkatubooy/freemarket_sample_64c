class Picture < ApplicationRecord
  mount_uploaders :image, ImageUploader

  #Association
  belongs_to :item
end
