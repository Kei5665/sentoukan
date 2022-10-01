class MapsController < ApplicationController
  def index
    initial_value_of_maps
    if params[:q]
      latitude = current_position_params[:latitude].to_f
      longitude = current_position_params[:longitude].to_f
      shops = Shop.within(@search_radius, origin: [latitude, longitude])
      gon.latitude = latitude
      gon.longitude = longitude
      gon.shops = shops
    else
      gon.latitude = @default_lat
      gon.longitude = @default_lng
    end
  end

  def show; end

  private

    def current_position_params
      params.require(:q).permit(:latitude, :longitude)
    end

    def initial_value_of_maps
      @search_radius = 2.5
      @default_lat = 35.68141918996472
      @default_lng = 139.76709261065324
    end
end
