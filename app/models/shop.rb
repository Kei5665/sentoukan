class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
