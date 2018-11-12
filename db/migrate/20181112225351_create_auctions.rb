class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :puja
      t.integer :actual
      t.string :fecha
      t.users :participantes
      t.string :precio
      t.integer :minimo

      t.timestamps
    end
  end
end
