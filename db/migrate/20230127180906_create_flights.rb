class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id, null: false, foreign_key: true
      t.integer :arrival_airport_id, null: false, foreign_key: true
      t.date :departure_date
      t.time :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
