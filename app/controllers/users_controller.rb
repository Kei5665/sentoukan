class UsersController < ApplicationController
  def new
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      auto_login(current_user)
      redirect_to maps_path, green: "ユーザー登録が完了しました！"
    else
      flash.now[:pink] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end