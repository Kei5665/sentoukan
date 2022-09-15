class Shop < ApplicationRecord
  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :quests, dependent: :destroy
end
