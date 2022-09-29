class RemoveNameFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :name, :string
    remove_column :reservations, :image, :string
    remove_column :reservations, :introduction, :text
    remove_column :reservations, :day_price, :integer
  end
end
