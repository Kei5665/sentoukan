class MapsController < ApplicationController
  def index
    search_radius = 2.0
    default_lat = 35.64806
    default_lng = 139.7416326
    if params[:q]
      latitude = geo_params[:latitude].to_f
      longitude = geo_params[:longitude].to_f
      shops = Shop.all.within(search_radius, origin: [latitude, longitude]).by_distance(origin: [latitude, longitude])
      gon.latitude = latitude
      gon.longitude = longitude
      gon.shops = shops
    else
      gon.latitude = default_lat
      gon.longitude = default_lng
    end
  end

  private

    def geo_params
      params.require(:q).permit(:latitude, :longitude)
    end
end
