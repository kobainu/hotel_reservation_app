class RoomsController < ApplicationController

  def search
    @results = @q.result
    @q = Room.ransack
  end

  def posts
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @user = User.find(current_user.id)
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "新規ルーム登録に成功しました"
      redirect_to :root
    else
      @user = User.find(current_user.id)
      flash.now[:alert] = "登録に失敗しました"
      render 'new'
    end
  end

  def show
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
  end

  private

    def room_params
      params.permit(:image, :name, :introduction, :price, :address, :user_id)
    end

    def reservation_params
      params.permit(:image, :name, :introduction, :total_price, :start_date, :end_date, :room_id, :num_person, :day_price)
    end

end
