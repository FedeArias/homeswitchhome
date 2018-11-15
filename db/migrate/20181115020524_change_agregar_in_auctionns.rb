class ChangeAgregarInAuctionns < ActiveRecord::Migration[5.1]
  def change
    add_column :auctionns, :nombre, :string
  end
end
