class ChangePurchase < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :user_id, :integer
    add_column :purchases, :property_id, :integer
  end
end
