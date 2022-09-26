class RoomsController < ApplicationController
  # 検索結果一覧画面
  def search

  end

  # 登録済みルーム一覧画面
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end

  # ルーム新規登録画面
  def new
    @user = User.find(current_user.id)
    @room = Room.new
  end
  
  # ルーム新規登録処理
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "新規ルーム登録に成功しました"
      redirect_to :root
    else
      @user = User.find_by(params[:room][:user_id])
      flash.now[:notice] = "登録に失敗しました"
      render 'new'
    end
  end

  # ルーム詳細画面
  def show
    @room = Room.find(params[:id])
  end

  private

    def room_params
      params.permit(:image, :name, :introduction, :price, :address, :user_id)
    end

end
