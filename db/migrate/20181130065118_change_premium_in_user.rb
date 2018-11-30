class ChangePremiumInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :premium
    remove_column :users, :esAdmin
    add_column :users, :premium, :boolean, default: false 
    add_column :users, :esAdmin, :boolean, default: false
  end
end
