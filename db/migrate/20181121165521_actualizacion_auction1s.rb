class ActualizacionAuction1s < ActiveRecord::Migration[5.1]
  def change
    change_table  :auction1s do |t|
      t.date :fechanew
      t.remove :fecha
    end
  end
end
