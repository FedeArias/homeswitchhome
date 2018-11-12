class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.integer :DNI
      t.string :contraseña
      t.string :fecha
      t.string :de
      t.integer :nacimiento
      t.string :email
      t.string :datos
      t.string :de
      t.string :tarjeta

      t.timestamps
    end
  end
end
