class UsersController < ApplicationController
  def update
    if current_user.update(user_update_params)
      redirect_to maps_path, green: "ユーザー登録が完了しました！"
    else
      flash.now[:pink] = "ユーザー登録に失敗しました"
      render 'quests/show'
    end
  end

  private

    def user_update_params
      params.requre(:user).permit(:name, :email)
    end
end