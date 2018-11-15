class ChangeparametrosInAuctionns < ActiveRecord::Migration[5.1]
  def change
    add_column :auctionns, :licitacion, :integer
    add_column :auctionns, :monto, :integer

  end
end
