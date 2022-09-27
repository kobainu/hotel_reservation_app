class AddDayPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :day_price, :integer
  end
end
