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
    
  end

  private

    def quest_params
      params.require(:quest).permit(:shop_id, :user_id, :latitude, :longitude)
    end
end
