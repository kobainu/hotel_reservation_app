class ReservationsController < ApplicationController
  require "date"

  # 予約一覧画面
  def index
    @reservations = Reservation.all
  end

  # 予約確認画面
  def new
    @room = Room.find_by(id: params[:room_id])
    @reservation = Reservation.new(reservation_params)
    start_date = @reservation.start_date
    end_date = @reservation.end_date
    # 使用日数
    @reservation_days = (end_date - start_date).to_i / 86400
    # 合計金額
    @reservation.total_price = @room.price * @reservation.num_person * @reservation_days
    # binding.pry
  end
  
  # 予約確定処理
  def create
    @room = Room.find_by(id: params[:room_id])
    @reservation = Reservation.create(reservation_params)
    redirect_to reservation_path(@reservation.id)
  end
  
  # 予約完了画面
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  private

    def reservation_params
      params.permit(:image, :name, :introduction, :total_price, :start_date, :end_date, :room_id, :num_person)
    end

end
