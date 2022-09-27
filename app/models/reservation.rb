class Reservation < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :room
end
