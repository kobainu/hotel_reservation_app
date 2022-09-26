class RoomsController < ApplicationController
  # 検索結果一覧
  def index
    @rooms = Room.all
  end

  # ルーム新規登録
  def new
    @room = Room.new
  end

  # ルーム詳細
  def show
  end

  # 登録済みルーム一覧
  def posts
  end

end
