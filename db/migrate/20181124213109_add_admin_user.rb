class AddAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :esAdmin, :boolean 
  end
end
