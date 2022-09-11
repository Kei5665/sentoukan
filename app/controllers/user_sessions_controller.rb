class UserSessionsController < ApplicationController
  def guest_login

    random_value = SecureRandom.hex
    user = User.create!(name: "ゲスト", email: "test_#{random_value}@example.com",)
    auto_login(user)
    redirect_to quests_path, success: "ゲストでログインしました！クエストを開始します！"
  end
end
