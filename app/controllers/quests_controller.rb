class QuestsController < ApplicationController
  def index
  end

  def create
    quest = Quest.new(quest_params)
  end

  private

    def quest_params
      params.require(:quest).permit(:shop_id, :user_id, :latitude, :longitude)
    end
end
