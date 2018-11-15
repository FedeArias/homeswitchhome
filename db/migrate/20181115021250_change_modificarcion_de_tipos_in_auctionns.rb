class ChangeModificarcionDeTiposInAuctionns < ActiveRecord::Migration[5.1]
  def down
    change_table :auctionns do |t|
      t.change  :puja, :string 
      t.change  :precio, :string 
    end
  end
  
end
