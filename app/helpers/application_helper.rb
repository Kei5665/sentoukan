module ApplicationHelper
  def number_of_quest_experiences
    "#{current_user.quests.count} 件"
  end

  def earned_money
    "#{current_user.earned_money} 円"
  end

  def user_name
    "#{current_user.name} 様"
  end

  def full_title(page_title = '')
    base_title = '銭湯館'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def full_url(path)
    domain = if Rails.env.development?
               'http://0.0.0.0:3000'
             else
               'https://www.sentoukan.site/'
             end
    "#{domain}#{path}"
  end
end
