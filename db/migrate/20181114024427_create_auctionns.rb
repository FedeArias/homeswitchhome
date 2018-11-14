class CreateAuctionns < ActiveRecord::Migration[5.1]
  def change
    create_table :auctionns do |t|
      t.string :puja
      
      t.string :fecha
      t.string :precio
      t.integer :minimo

      t.timestamps
    
    end
  end
end
