class AddNumPersonToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :num_person, :integer
  end
end
