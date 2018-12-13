class Montominimo < ActiveRecord::Migration[5.1]
  def change
    add_column :auction1s, :montominimo, :float
  end
end
