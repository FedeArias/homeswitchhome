class RemoveContrasenaFromUsers < ActiveRecord::Migration[5.1]
  def change
    
      remove_column :users, :contraseña
      remove_column :users, :datosDeTarjeta
      remove_column :users, :fechaDeNacimiento
      add_column :users, :vencimientoTarjeta, :date
      add_column :users, :codigoTarjeta, :integer
      add_column :users, :numeroTarjeta, :string
      add_column :users, :fechaNacimiento, :date

    
  end
end
