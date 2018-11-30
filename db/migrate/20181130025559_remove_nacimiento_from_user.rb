class RemoveNacimientoFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fechaNacimiento
    add_column :users, :edad, :integer
  end
end
