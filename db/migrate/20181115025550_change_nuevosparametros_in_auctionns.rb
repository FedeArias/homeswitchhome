class ChangeNuevosparametrosInAuctionns < ActiveRecord::Migration[5.1]
  def change
    add_column :auctionns, :Puja , :integer
    add_column :auctionns, :Precio , :integer
  end
end
