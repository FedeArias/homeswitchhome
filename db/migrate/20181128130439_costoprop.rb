class Costoprop < ActiveRecord::Migration[5.1]
  def change
    change_table  :properties do |t|
      t.float :monto
      t.remove :precio
    end

  end
end
