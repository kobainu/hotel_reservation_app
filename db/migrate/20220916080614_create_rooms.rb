class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string  :name
      t.string  :image
      t.text    :introduction
      t.integer :price
      t.string  :address

      t.timestamps
    end
  end
end
