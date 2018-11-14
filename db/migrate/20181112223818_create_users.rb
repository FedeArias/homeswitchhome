class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.integer :DNI
      t.string :contraseña
      t.string :fechaDeNacimiento
      t.string :email
      t.string :datosDeTarjeta

      t.timestamps
    end
  end
end
