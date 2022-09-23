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

  def range_from(current_position)
    # ラジアン単位に変換
    x1 = deg2rad(current_position[:latitude])
    y1 = deg2rad(current_position[:longitude])
    x2 = deg2rad(self.latitude)
    y2 = deg2rad(self.longitude)

    # 地球の半径 (km)
    radius = 6378.137

    # キロメートル単位
    km_unit = 1000

    # 差の絶対値
    diff_y = (y1 - y2).abs

    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)

    # 分子
    numerator = Math.sqrt(calc1**2 + calc2**2)

    # 分母
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)

    # 弧度
    degree = Math.atan2(numerator, denominator)

    # 大円距離 (km)
    (degree * radius * km_unit).round(0)
  end

  def deg2rad(degrees)
    degrees.to_f / 180.0 * Math::PI
  end
end
