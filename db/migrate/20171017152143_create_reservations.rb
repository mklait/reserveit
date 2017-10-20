class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :GuestName
      t.datetime :TimeDate
      t.integer :guests
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
