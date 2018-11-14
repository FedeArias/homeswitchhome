class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.text :descripcion
      t.string :nombre
      t.string :lugar
      

      t.timestamps
    end
  end
end
