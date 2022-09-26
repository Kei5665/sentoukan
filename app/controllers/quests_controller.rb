class QuestsController < ApplicationController
  before_action :require_quests, only: %i[index]
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
    @distance = shop.range_from(current_position_params)
    if @distance < permissible_range
      current_user.earn_rewards
      redirect_to new_user_path, green: 'お疲れ様でした！報酬は800円です！'
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
end
