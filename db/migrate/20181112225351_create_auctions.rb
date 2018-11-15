class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.ingeger :puja
      t.string :fecha
      t.users :participante
      t.string :precio
      t.string :precio
      t.integer :minim
      t.integer :precioMinimo
      t.timestamps
    end
  end
end
