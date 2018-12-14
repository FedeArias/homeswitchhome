class Columna < ActiveRecord::Migration[5.1]
  def change
    remove_column :auction1s, :ganador
    add_column :auction1s, :ganador, :integer 
  end
end
