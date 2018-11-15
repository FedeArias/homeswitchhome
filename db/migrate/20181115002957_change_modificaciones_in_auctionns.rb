class ChangeModificacionesInAuctionns < ActiveRecord::Migration[5.1]
  
  def def up
    change_table :auctionns do |t|
      add_column :auctionns, :nombre, :string
      t.column  :puja, :integer
      t.column  :precio, :integer  
    end  
  end
   
    def down
      change_table :auctionns do |t|
        t.change :puja, :string
        t.change :precio, :string
      end  
  end
end
