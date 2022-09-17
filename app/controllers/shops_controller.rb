class ShopsController < ApplicationController
  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result.order(created_at: :desc).page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
    longitude = @shop.longitude
    latitude = @shop.latitude
    @shops = Shop.all.within(2.0, origin: [latitude, longitude]).by_distance(origin: [latitude, longitude])
  end
end
