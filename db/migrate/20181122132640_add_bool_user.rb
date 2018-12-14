class AddBoolUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :premium, :boolean 
    add_column :users, :vencimientoTarjeta, :date
  end
end
