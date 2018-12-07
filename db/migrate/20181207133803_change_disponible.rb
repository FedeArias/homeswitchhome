class ChangeDisponible < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :disponible
    add_column :properties, :disponible, :boolean, default: true 
  end
end
