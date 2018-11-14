class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.ingeger :pujamActual
      t.string :fecha
     # t.users :participantes

      t.integer :precioMinimo

     t.timestamps
    end
  end
end
