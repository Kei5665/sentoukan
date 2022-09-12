class MapsController < ApplicationController
  def index
    search_radius = 2.0
    default_lat = 35.68141918996472
    default_lng = 139.76709261065324
    if params[:q]
      latitude = geo_params[:latitude].to_f
      longitude = geo_params[:longitude].to_f
      shops = Shop.all.within(search_radius, origin: [latitude, longitude]).by_distance(origin: [latitude, longitude])
      gon.latitude = latitude
      gon.longitude = longitude
      gon.shops = shops
      gon.user = current_user
    else
      gon.latitude = default_lat
      gon.longitude = default_lng
    end
  end

  def show
  end

  private

    def geo_params
      params.require(:q).permit(:latitude, :longitude)
    end
end
