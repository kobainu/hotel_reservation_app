class Room < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true


  belongs_to :user
  has_many :reservations
end
