module ApplicationHelper
  def number_of_quest_experiences
    "#{current_user.quests.count}件"
  end

  def earned_money
    "#{current_user.earned_money}円"
  end

  def user_name
    "#{current_user.name}様"
  end
end
