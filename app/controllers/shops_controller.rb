class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    longitude = @shop.longitude
    latitude = @shop.latitude
    @shops = Shop.all.within(2.0, origin: [latitude, longitude]).by_distance(origin: [latitude, longitude])
  end
end
