class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  add_flash_types :pink, :orange, :green, :blue

  def require_quests
    return if current_user.quests.present?

    if current_user.quests.blank?
      redirect_to maps_path, orange: 'クエストを選択してください'
    end
  end
end
