class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.ingeger :pujamActual
      t.string :fecha
     # t.users :participantes
<<<<<<< HEAD
      t.string :precio
      t.string :precio
      t.integer :minimo
=======
      t.integer :precioMinimo
>>>>>>> 2f0c146271d9e858b47797c8a5dce4d43a02b38f

     t.timestamps
    end
  end
end
