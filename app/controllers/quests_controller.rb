class QuestsController < ApplicationController
  def index
    quest = current_user.quests.last
    @shop = quest.shop
    gon.latitude = quest.latitude.to_f
    gon.longitude = quest.longitude.to_f
    gon.shop = quest.shop
  end

  def create
    quest = current_user.quests.build(quest_params)
    if quest.save
      redirect_to quests_path, green: "クエストを開始します！"
    else
      redirect_to maps_path, pink: "クエストを開始できませんでした"
    end
  end

  def calculate
    search_radius = 1.0
    latitude = geo_params[:latitude].to_f
    longitude = geo_params[:longitude].to_f
    arrival_point = Shop.within(search_radius, origin: [latitude, longitude])
    if arrival_point.present?
      current_user.get_money
      redirect_to maps_path, green: "お疲れ様でした！報酬は800円です！"
    else
      render turbo_stream: turbo_stream.prepend(
        'error',
        partial: 'shared/error',
      )
    end
  end

  private

    def quest_params
      params.require(:q).permit(:shop_id, :latitude, :longitude)
    end

    def geo_params
      params.require(:q).permit(:latitude, :longitude)
    end
end
