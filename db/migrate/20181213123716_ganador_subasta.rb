class GanadorSubasta < ActiveRecord::Migration[5.1]
  def change
    add_column :auction1s, :ganador, :string
  end
end
