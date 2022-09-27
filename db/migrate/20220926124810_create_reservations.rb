class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.string :name
      t.string :image
      t.text :introduction
      t.integer :total_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
