class QuestsController < ApplicationController
  def index
    quest = current_user.quests.last
    @shop = quest.shop
    gon.latitude = quest.latitude.to_f
    gon.longitude = quest.longitude.to_f
    gon.shop = quest.shop
  end

  def create
    quest = Quest.new(quest_params)
    quest.save!
  end

  def calculate
    search_radius = 0.1
    latitude = geo_params[:latitude].to_f
    longitude = geo_params[:longitude].to_f
    arrival_point = Shop.within(search_radius, origin: [latitude, longitude])
    if arrival_point.present?
      redirect_to maps_path
    else
      render turbo_stream: turbo_stream.prepend(
        'error',
        partial: 'shared/error',
      )
    end
  end

  private

    def quest_params
      params.require(:quest).permit(:shop_id, :user_id, :latitude, :longitude)
    end

    def geo_params
      params.require(:q).permit(:latitude, :longitude)
    end
end
