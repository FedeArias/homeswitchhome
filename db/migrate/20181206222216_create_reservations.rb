class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :semana

      t.timestamps
    end
  end
end
