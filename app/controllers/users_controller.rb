class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      auto_login(user)
      redirect_to maps_path, green: "ユーザー登録が完了しました！"
    else
      flash.now[:pink] = "ユーザー登録に失敗しました"
      render 'quests/show'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end