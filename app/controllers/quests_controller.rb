class QuestsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :require_quests, only: %i[index]
>>>>>>> a3254c7b79e4a5c6b964ea0c318da7259824961e
  def index
    quest = current_user.quests.last
    @shop = quest.shop
    gon.latitude = quest.latitude.to_f
    gon.longitude = quest.longitude.to_f
    gon.shop = quest.shop
    current_position = { latitude: quest.latitude, longitude: quest.longitude }
    @distance = @shop.range_from(current_position)
  end

  def create
    quest = current_user.quests.build(quest_params)
    if quest.save
      redirect_to quests_path, green: 'クエストを開始します！'
    else
      redirect_to maps_path, pink: 'クエストを開始できませんでした'
    end
  end

  def calculate
    permissible_range = 1000
    shop = current_user.quests.last.shop
<<<<<<< HEAD
    distance = distance(geo_params, shop)
    if distance < within_can_clear_limits
      current_user.recieve_money
      redirect_to maps_path, green: 'お疲れ様でした！報酬は800円です！'
=======
    @distance = shop.range_from(current_position_params)
    if @distance < permissible_range
      current_user.earn_rewards
      redirect_to new_user_path, green: 'お疲れ様でした！報酬は800円です！'
>>>>>>> a3254c7b79e4a5c6b964ea0c318da7259824961e
    else
      render turbo_stream: [
        turbo_stream.prepend(
          'error',
          partial: 'shared/error',
        ),
        turbo_stream.update(
          'distance',
          partial: 'quests/distance',
          locals: { distance: @distance },
        ),
      ]
    end
  end

  private

    def quest_params
      params.require(:q).permit(:shop_id, :latitude, :longitude)
    end

    def current_position_params
      params.require(:q).permit(:latitude, :longitude)
    end
<<<<<<< HEAD

    def distance(from, to)
      # ラジアン単位に変換
      x1 = deg2rad(from[:latitude])
      y1 = deg2rad(from[:longitude])
      x2 = deg2rad(to.latitude)
      y2 = deg2rad(to.longitude)

      # 地球の半径 (km)
      radius = 6378.137

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
      distance = degree * radius
    end

    def deg2rad(degrees)
      degrees.to_f / 180.0 * Math::PI
    end
=======
>>>>>>> a3254c7b79e4a5c6b964ea0c318da7259824961e
end
