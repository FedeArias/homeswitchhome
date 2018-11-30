class Costopropiedades < ActiveRecord::Migration[5.1]
  def change
    change_table  :auction1s do |t|
      t.float :monto
      t.remove :precio
    end

  end
end
