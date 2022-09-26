class UsersController < ApplicationController
  # アクセス権限 => ログイン済みのユーザーのみ
  before_action :authenticate_user!

  # アカウント画面 => users_account_path
  def account
  end
  
  # プロフィール編集画面 => users_profile_path
  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    # binding.pry

    if @user.update(update_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to users_profile_path
    else
      flash.now[:notice] = "更新に失敗しました"
      render :users_profile_path
    end
  end
  
  private

    def update_params
      params.permit(:image, :name, :profile)
    end

end
