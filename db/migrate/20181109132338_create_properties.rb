class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.text :descripcion
      t.string :nombre
      t.string :lugar
      #add_column :costo, :bodyweight, :decimal, precision: 7, scale: 2

      t.timestamps
    end
  end
end
