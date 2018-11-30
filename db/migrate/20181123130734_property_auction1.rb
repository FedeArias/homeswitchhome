class PropertyAuction1 < ActiveRecord::Migration[5.1]
  def change
    add_column :auction1s, :property_id, :integer
  end
end
