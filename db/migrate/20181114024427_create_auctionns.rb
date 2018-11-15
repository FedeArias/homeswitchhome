class CreateAuctionns < ActiveRecord::Migration[5.1]
  def change
    create_table :auctionns do |t|
      t.string :puja
      t.string :fecha
  
      t.string :precio  #usado para nombre de la propiedad
      t.integer :minimo #usado para precio

      t.timestamps
    
    end
  end
end
