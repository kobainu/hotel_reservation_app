class ReservationsController < ApplicationController
  require "date"

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new(reservation_params)
    if @reservation.start_date < Date.today
      flash[:alert] = "開始日は本日以降の日付を選択してください"
      @room = Room.find(params[:room_id])
      redirect_to @room

    elsif @reservation.end_date <= @reservation.start_date
      flash[:alert] = "終了日は開始日の翌日以降の日付を選択してください"
      @room = Room.find(params[:room_id])
      redirect_to @room

    else
      @room = Room.find_by(id: params[:room_id])
      start_date = @reservation.start_date
      end_date = @reservation.end_date
      # 使用日数
      @reservation_days = (end_date - start_date).to_i / 86400
      # 合計金額
      @reservation.total_price = @room.price * @reservation.num_person * @reservation_days
    end
  end
  
  def create
    @room = Room.find_by(id: params[:room_id])
    @reservation = Reservation.create(reservation_params)
    flash[:notice] = "予約が完了しました"
    redirect_to reservation_path(@reservation.id)
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  private

    def reservation_params
      params.permit(:total_price, :start_date, :end_date, :room_id, :num_person)
    end

end
